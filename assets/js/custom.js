function validateRegisterForm() {

    let fname = document.forms["registerForm"]["fullName"].value;
    if (fname == "") {
      alert("Name must be filled out");
      return false;
    }

    let email = document.forms["registerForm"]["emailId"].value;
    
    if (email == "") {
      alert("Email must be filled out");
      return false;
    }

    let username = document.forms["registerForm"]["userName"].value;
    if (username == "") {
      alert("Username must be filled out");
      return false;
    }

    let password = document.forms["registerForm"]["passWord"].value;
    if (password == "") {
      alert("password must be filled out");
      return false;
    }

    let cpassword = document.forms["registerForm"]["conformPassWord"].value;
    if (cpassword == "") {
      alert("Conform password must be filled out");
      return false;
    }

    if (cpassword == password) {
        return true;  
    }  
    else{  
        alert("password must be same!");  
        return false;  
    }    
    
  }


  function validateLoginForm() {

    let username = document.forms["loginForm"]["username"].value;
    if (username == "") {
      alert("Username must be filled out");
      return false;
    }

    let password = document.forms["loginForm"]["password"].value;
    if (password == "") {
      alert("Password must be filled out");
      return false;
    }
  }

  