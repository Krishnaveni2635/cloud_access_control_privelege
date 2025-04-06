package com.cloud.kk.action;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Upload extends HttpServlet {

    private static java.sql.Date getCurrentDate() {
        return new java.sql.Date(new java.util.Date().getTime());
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            Connection con;
            PreparedStatement pstm = null;
            String fid = "";
            int fid1 = 0;
            String fname = "";
            String email = (String) request.getSession().getAttribute("email");
            String uid = (String) request.getSession().getAttribute("uid");

            System.out.println("User Name : " + email);
            
            boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
            if (!isMultipartContent) {
                return;
            }

            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                List<FileItem> fields = upload.parseRequest(request);
                Iterator<FileItem> it = fields.iterator();
                if (!it.hasNext()) {
                    return;
                }

                while (it.hasNext()) {
                    FileItem fileItem = it.next();
                    if (fileItem.getFieldName().equals("fid")) {
                        fid = fileItem.getString();
                        fid1 = Integer.parseInt(fid);
                        System.out.println("File ID: " + fid);
                    } else if (fileItem.getFieldName().equals("fname")) {
                        fname = fileItem.getString();
                        System.out.println("File Name: " + fname);
                    }

                    if (!fileItem.isFormField()) {
                        try {
                            con = Dbconnection.getConnection();
                            pstm = con.prepareStatement("INSERT INTO files (fid, file, filetype, filename, CDate, owner, size, data, uid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

                            System.out.println("File Name: " + fileItem.getName());

                            // Convert file content to String
                            String fileContent = getStringFromInputStream(fileItem.getInputStream());

                            // Encrypt file content
                            String encryptedData = new TrippleDes().encrypt(fileContent);
                            String encryptedDataFinal = new TrippleDes().encrypt(encryptedData);

                            // Get file extension
                            String fileExtension = fileItem.getName().substring(fileItem.getName().lastIndexOf('.'));
                            System.out.println("File Extension: " + fileExtension);

                            // Insert into database
                            pstm.setInt(1, fid1);
                            pstm.setBinaryStream(2, fileItem.getInputStream());
                            pstm.setString(3, fileExtension);
                            pstm.setString(4, fname);
                            pstm.setDate(5, getCurrentDate());
                            pstm.setString(6, email);
                            pstm.setLong(7, fileItem.getSize());
                            pstm.setString(8, encryptedDataFinal);
                            pstm.setString(9, uid);

                            // Ensure directory exists before writing file
                            File folder = new File("C:\\Uploads");
                            if (!folder.exists()) {
                                folder.mkdir();
                            }

                            
                            File fileToSave = new File(folder, fileItem.getName());
                            FileWriter fileWriter = new FileWriter(fileToSave);
                            fileWriter.write(encryptedData);
                            fileWriter.close();

                            // Upload to FTP server
                            Ftpcon ftpcon = new Ftpcon();
                            ftpcon.upload(fileToSave, fname);

                            // Execute DB Insert
                            int i = pstm.executeUpdate();
                            if (i == 1) {
                                response.sendRedirect("upload.jsp?msg=success");
                            } else {
                                response.sendRedirect("upload.jsp?msgg=failed");
                            }

                            con.close();
                        } catch (Exception e) {
                            out.println("Error: " + e.toString());
                            e.printStackTrace();
                        }
                    }
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception ex) {
                Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private static String getStringFromInputStream(InputStream is) {
        StringBuilder sb = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(is))) {
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line).append("\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "File Upload Servlet";
    }
}
