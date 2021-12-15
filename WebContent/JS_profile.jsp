<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Give Details</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">
  <div id="hd">
  <center><h1 style="color:white;width:100%;height:80px;padding:20px;font-size:50px;"><b> A Resume Evaluation System Based on Text Mining </b></h1></center>
</div>


  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Details</h1>
                
              </div>
              <form class="user" action="JS" method="POST" enctype="multipart/form-data">
              <center>Here * indicates required fields:</center><br>
              <b><b>Personal Details:</b></b>
                <div class="form-group">
               <input type="text" name="username" class="form-control form-control-user" id="exampleInputName" placeholder="Enter your full Name *" required>
                </div>
                <div class="form-group">
                  <input type="text" maxlength="10" name="usermobile" class="form-control form-control-user" id="exampleInputNumber" placeholder="Mobile Number *" required>
                </div>
                 <div class="form-group">
                  <input type="email" name="usermail" class="form-control form-control-user" id="exampleInputMail" placeholder="valid Email-Id *" required>
                </div>
                <div class="form-group">
                  <input type="text" name="useraddress" class="form-control form-control-user" id="exampleInputAddress" placeholder="Address *" required>
                </div>
               <b><b> Educational Details:</b></b>
               SSC Details:
               <div class="form-group">
                  <input type="text" name="school_name" class="form-control form-control-user" id="exampleInputAddress" placeholder="School name *" required>
                </div>
               
                <div class="form-group">
                  <input type="text" name="CGPA_10" class="form-control form-control-user" id="exampleInputAddress" placeholder="10-CGPA *" required>
                </div>
                12 Details:
                <div class="form-group">
                  <input type="text" name="acadamy" class="form-control form-control-user" id="exampleInputAddress" placeholder="acadamy *" required>
                </div>
                
                <div class="form-group">
                  <input type="text" name="CGPA_12" class="form-control form-control-user" id="exampleInputAddress" placeholder="12-CGPA *" required>
                </div>
                
                <div class="form-group">
                  <input type="text" name="branch" class="form-control form-control-user" id="exampleInputAddress" placeholder="specialization *" required>
                </div>
                Graduation Details:
               <div class="form-group">
                  <input type="text" name="college_name" class="form-control form-control-user" id="exampleInputAddress" placeholder="Name of the college *" required>
                </div>
               
                <div class="form-group">
                  <input type="text" name="CGPA_graduation" class="form-control form-control-user" id="exampleInputAddress" placeholder="graduation-CGPA *" required>
                </div>
                <div class="form-group">
                  <input type="text" name="graduation_branch" class="form-control form-control-user" id="exampleInputAddress" placeholder="specialization *" required>
                </div>
                 <div class="form-group">
                  <input type="text" name="year" class="form-control form-control-user" id="exampleInputAddress" placeholder="year *" required>
                </div>
                
                <div class="form-group">
                  <input type="text" name="skills" class="form-control form-control-user" id="exampleInputAddress" placeholder="enter your skills *" required>
                </div>
                
                
                <b><b>Experience Details:</b></b>
                <div class="form-group">
                  <input type="text" name="previous_company" class="form-control form-control-user" id="exampleInputAddress" placeholder="Name of previous company">
                </div>
                <div class="form-group">
                  <input type="text" name="previous_package" class="form-control form-control-user" id="exampleInputAddress" placeholder="package in lpa">
                </div>
                <div class="form-group">
                  <input type="text" name="expecting_package" class="form-control form-control-user" id="exampleInputAddress" placeholder="Expecting package in lpa">
                </div>
                 <div class="form-group">
                <b><b>upload resume here</b></b><br>
                  Select a file * : <input type="file" name="myFile" required><br><br>
  					
                </div>
                
                 
               <!--   <div id=res class="w3-modal w3-center w3-animate-zoom" style="display:inline-block;">
<div class="w3-modal-content">
  <div class="w3-container w3-teal"> 
        <span onclick="document.getElementById('res').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
          <h1>Upload Resume</h1>
      </div>
<div>
<form action="FileUpload" enctype="multipart/form-data" method="post"> 
<br><br><br>
<input class="w3-btn w3-teal" type=file name=file1 required><br><br><br>
<input class="w3-btn w3-teal" id=for type=submit value=submit><br><br><br>
</form> 
</div>
</div>
</div>
 -->                 
                <button type="submit" class="btn btn-primary btn-user btn-block" value="submit">
                  Submit Details</button>
         
              
                <hr>
              
              </form>
              <hr>
              <!-- <div class="text-center">
                <a class="small" href="JS_login.jsp">Already have an account? Login!</a>
              </div> -->
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

</body>

</html>
