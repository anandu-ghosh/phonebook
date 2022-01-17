<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Address Book | Login</title>
    <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="./assets/fontawesome/css/all.css" rel="stylesheet" />
    <link href="./assets/css/custom.css" rel="stylesheet" />
    <script src="./assets/js/custom.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg nav-bar">
        <a class="navbar-brand" href="#">ADDRESS BOOK</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
          <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            
          </ul>
          <div class="form-inline my-2 my-lg-0">
          <cfif StructKeyExists(session, "loggedin") >
            <a href="cfc/logout.cfc?id=logout" class="my-sm-2 mr-sm-3"><i class="fas fa-sign-out-alt"></i> Logout</a>
          <cfelse>
            <a href="register.cfm" class="mr-sm-5"><i class="fas fa-user-alt"></i> Sign Up</a>
            <a href="index.cfm" class="my-sm-2 mr-sm-3"><i class="fas fa-sign-in-alt"></i> Login</a>
          </cfif>

          </div>
        </div>
      </nav>