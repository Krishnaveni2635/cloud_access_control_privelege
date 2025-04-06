<!DOCTYPE html>
<html>

    <head>
        <title>Control Cloud Data Access Privilege</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables HTML5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
        <script type="text/javascript">
            // Additional custom validation (if needed)
            function validateForm() {
                var name = document.f1.name.value;
                var email = document.f1.email.value;
                var dob = document.f1.dob.value;
                var phone = document.f1.phone.value;
                var role = document.f1.role.value;

                // Validate Name - must be less than or equal to 12 characters
                if (name.length > 12) {
                    alert("Name must be under or equal to 12 characters.");
                    return false;
                }

                // Validate Email - simple check for email pattern
                var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
                if (!emailPattern.test(email)) {
                    alert("Please enter a valid email address.");
                    return false;
                }

                // Validate Date of Birth - Must not be a future date
                var today = new Date();
                var selectedDate = new Date(dob);
                if (selectedDate > today) {
                    alert("Date of birth cannot be in the future.");
                    return false;
                }

                // Validate Mobile Number - Should be exactly 10 digits
                var phonePattern = /^[0-9]{10}$/;
                if (!phonePattern.test(phone)) {
                    alert("Please enter a valid 10-digit mobile number.");
                    return false;
                }

                return true; // All validations passed, form can be submitted
            }
        </script>
    </head>

    <body>
        <% 
            if(request.getParameter("msg")!=null) { 
        %>
            <script>alert('Registration Successfully\n Email id as Your username');</script>    
        <% 
            } 
            if(request.getParameter("msgg")!=null) { 
        %>
            <script>alert('Registration Failed');</script>  
        <% 
            } 
        %>

        <div id="main">		
            <header>
                <div id="strapline">
                    <div id="welcome_slogan">
                        <h3 style="color: red">ENHANCING CLOUD SECURITY WITH ANONYMOUS PRIVILEGE</h3>
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

            <div id="site_content">
                <div><h1 style="text-align: center">Registration Form</h1></div>
                <br />
                <div class="container">
                    <div class="form1">
                        <form id="contactform" name="f1" action="registrationProcess.jsp" method="GET" onsubmit="return validateForm()"> 
                            <p class="contact"><label for="name">Name</label></p> 
                            <input id="name" name="name" type="text" placeholder="First and last name" required="" maxlength="12" tabindex="1"> 

                            <p class="contact"><label for="email">Email</label></p> 
                            <input id="email" name="email" placeholder="example@domain.com" required="" type="email" tabindex="2"> 

                            <fieldset>
                                <label>Date Of Birth</label><br /><br />
                                <input type="date" style="width: 400px" name="dob" required="" max="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" tabindex="3"/>
                            </fieldset>

                            <label>Gender</label><br /><br />
                            <select class="select-style gender" name="gender" required="" tabindex="4">
                                <option value="select">I am..</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select><br><br>

                            <label>Role</label><br /><br />
                            <select class="select-style gender" name="role" required="" tabindex="5">
                                <option value="select">Please Select</option>
                                <option value="Owner">Owner</option>
                                <option value="Consumer">Consumer</option>
                            </select><br><br>

                            <p class="contact"><label for="phone">Mobile phone</label></p> 
                            <input id="phone" name="phone" placeholder="Enter 10-digit phone number" required="" type="text" pattern="^\d{10}$" maxlength="10" title="Please enter a valid 10-digit phone number" tabindex="6" oninput="restrictInput(this)"> <br>

                            <center><input class="buttom" name="submit" id="submit" tabindex="7" value="Sign me up!" type="submit"></center>
                        </form>
                    </div><!--close form1-->
                </div><!--close container-->	
            </div><!--close site_content-->  
        </div><!--close main-->
        
        <!-- javascript at the bottom for fast page loading -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/image_slide.js"></script>

        <script type="text/javascript">
            // Function to prevent more than 10 digits in mobile number field
            function restrictInput(input) {
                if (input.value.length > 10) {
                    input.value = input.value.slice(0, 10);
                }
            }
        </script>
    </body>  

</html>
