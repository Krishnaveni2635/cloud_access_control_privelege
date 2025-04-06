<%@page import="com.cloud.kk.action.TrippleDes"%>
<%@page import="com.cloud.kk.action.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html> 
<html>
    <head>
        <title>Control Cloud Data Access Privilege </title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables HTML5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
    </head>
    <body>
        <%
            if (request.getParameter("msg") != null) {%>
        <script>alert('Response Successfully');</script>  
        <%}
                if (request.getParameter("msgg") != null) {%>
        <script>alert('Response Failed');</script>
        <%}
        %>
        <div id="main">		
            <header>
                <div id="strapline">
                    <div id="welcome_slogan">
                        <h3 style="color: red">ENHANCING CLOUD SECURITY WITH  ANONYMOUS PRIVILEGE </h3>
                    </div><!--close welcome_slogan-->
                </div><!--close strapline-->	  
                <nav>
                    <br /><br />
                    <div id="menubar">
                        <ul id="nav">
                            <li class="current"><a href="ahome.jsp">Home</a></li>
                            <li><a href="response.jsp">Response</a></li>
                            <li><a href="index.jsp">Log Out</a></li>
                        </ul>
                    </div><!--close menubar-->	
                </nav>
            </header>
            <div id="site_content"><br />
                <div style="width: 1350px;height: 300px;">
                    <table style="margin-left: 200px;">
                        <tr>
                            <th>Owner id</th>
                            <th>Owner Key</th>
                            <th>N-Authorities Key</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                        <tr>
                            <%
                                Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;
                                try {
                                    con = Dbconnection.getConnection();
                                    st = con.createStatement();
                                    rs = st.executeQuery("select * from request");
                                    while (rs.next()) {%>
                            <td><%=rs.getString("uid")%></td>  
                            <td><%=rs.getString("prikey")%></td>  
                            <td><%=rs.getString("pkey")%></td> 
                            <td><%=rs.getString("status")%></td> 
                            <td><a href="raction.jsp?<%=rs.getString("mailid")%>,<%=rs.getString("uid")%>" style="text-decoration: none">Response</a></td>
                        </tr>
                        <%}
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        %>
                    </table>
                </div> 
            </div><!--close site_content-->  	

           
        </div><!--close main-->
        <!-- javascript at the bottom for fast page loading -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/image_slide.js"></script>
    </body>
</html>
