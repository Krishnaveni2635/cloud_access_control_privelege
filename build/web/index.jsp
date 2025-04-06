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
                            <li class="current"><a href="index.jsp">Home</a></li>
                            <li><a href="owner.jsp">Data Owner</a></li>
                            <li><a href="user.jsp">Data Consumer</a></li>
                            <li><a href="authority.jsp">Attribute Authority</a></li>
                            <li><a href="cloud.jsp">Cloud Server</a></li>
                        </ul>
                    </div><!--close menubar-->	
                </nav>
            </header>
            <div id="site_content" style="border: 2px solid red;margin-top: 100px;width: 1000px;margin-left: 200px;">
                <div style="width: 980px;"><br />
                    <h1 style="margin-left: 30px">Abstract</h1> 
                    <p style="font-size: 17px;font-family: Times New Roman;color: blue;text-align: justify;margin-left: 30px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  In cloud computing, maintaining data confidentiality, fine-grained access control, and user anonymity 
presents complex challenges. Traditional encryption schemes often fail to accommodate complex access 
policies and may expose user identities during the decryption process. To tackle these issues, we propose 
a fully anonymous attribute-based encryption (ABE) scheme that allows data owners to define detailed 
access policies based on user attributes, ensuring that only authorized users can decrypt the data. This 
approach not only enforces precise access control but also preserves user anonymity by preventing the 
revelation of their identities during decryption. 
Our scheme utilizes multiple attribute authorities to distribute attribute keys, decentralizing control and 
reducing the risk of identity exposure. Each authority manages a subset of attributes, and users receive 
attribute keys corresponding to their attributes without revealing their identities. When accessing 
encrypted data, users can only decrypt ciphertexts if their attributes meet the access policy, all while 
maintaining anonymity to both the data owner and the cloud service provider. Security analysis proves 
that the scheme is resistant to various attacks, such as collusion between users and authorities, ensuring 
robust protection of data in cloud environments. 
 </p></div>
            </div><!--close site_content-->  	

           
        </div><!--close main-->
        <!-- javascript at the bottom for fast page loading -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/image_slide.js"></script>
    </body>
</html>
