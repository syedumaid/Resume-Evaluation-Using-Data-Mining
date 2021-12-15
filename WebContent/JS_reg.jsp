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

  <title>Candidate_Register</title>

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
                <h1 class="h4 text-gray-900 mb-4">Candidate Register here!</h1>
              </div>
              <form class="user" action="JS_regdb.jsp" method="POST">
                <div class="form-group">
        
                  <input type="text" name="username" class="form-control form-control-user" id="exampleInputName" placeholder="Enter your Name">
                </div>
                <div class="form-group">
                  <input type="text" maxlength="10" name="usermobile" class="form-control form-control-user" id="exampleInputNumber" placeholder="Mobile Number">
                </div>
                 <div class="form-group">
                  <input type="email" name="usermail" class="form-control form-control-user" id="exampleInputMail" placeholder="Email-Id">
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" name="userpass" class="form-control form-control-user" id="examplePassword" placeholder="password">
                  </div>
                  <div class="col-sm-6">
                    <input type="Password" name="userconpass" class="form-control form-control-user" id="exampleConfirmPassword" placeholder="confirm Password">
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" name="useraddress" class="form-control form-control-user" id="exampleInputAddress" placeholder="Address">
                </div>
                <button type="submit" class="btn btn-primary btn-user btn-block">
                  Register Account</button>
         
              
                <hr>
              
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="JS_login.jsp">Already have an account? Login!</a>
              </div>
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
