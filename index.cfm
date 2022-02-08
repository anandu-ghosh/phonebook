<cfinclude  template = "include/header.cfm"  runOnce = "true">
             
        <div class="container box-section">
            <div class="row d-flex justify-content-center">
                <div class="col-md-9">
                    <div class="card px-5 py-5 box-card">
                        <div class="row">
                            <div class="col-md-4">

                            </div>
                            <div class="col-md-8">
                                <div class="form-data">
                                
                                    <form method="post" name="loginForm" action="cfc/login.cfc?method=loginData" onsubmit="return validateLoginForm()">
                                        <div class="text-center d-flex flex-column"> <h1>Login</h1></div>
                                        <div class="forms-inputs mb-5"><input name="username" class="text-field" autocomplete="off" type="text" placeholder="Username"/>
                                        </div>
                                        <div class="forms-inputs mb-5">  <input name="password" class="text-field" autocomplete="off" type="password" placeholder="Password"/>
                                        </div>
                                        <div class="mb-3"> <button type="submit" name="loginButton" class="btn btn-main-page w-100 ">Login</button> </div>
                                    </form>    
                                </div>
                                <div class="success-data">
                                    <div class="text-center d-flex flex-column"> <i class='bx bxs-badge-check'></i> <span class="text-center fs-1">Or Sign in Using <br><form method="post" action="cfc/google.cfc?method=googleLogin"> <button  onClick="FbLogin()" name="face-btn" class="social-btn"><i class="fab fa-facebook"></i></button> <button type="submit" name="google-btn" class="social-btn"><i class="fab fa-google-plus"></i></button></form><br>
                                    Don't have an account? <a href="register.cfm">Register Here</a>
                                    </span> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '915046725867308',
      xfbml      : true,
      version    : 'v12.0'
    });
    FB.AppEvents.logPageView();
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));


    function FbLogin() {
            FB.login(function (response) {
                if (response.authResponse) {
                    getFbUserData();
                } else {
                    document.getElementById('status').innerHTML = 'User cancelled login or did not fully authorize.';
                }
            }, {scope: 'email'});
        }
      
        function getFbUserData(){
            FB.api('/me', {locale: 'en_US', fields: 'id,first_name,last_name,email,link,gender,locale,picture'},
            function (response) {                
                saveUserData(response);                
            });
        }

        function saveUserData(userData){
          $.ajax({
              url: "cfc/login.cfc",
              type: "post", 
              dataType: "json",
              data: {
                  method: "facebookLogin",
                  email: userData.email,
                  first_name: userData.first_name,
                  last_name: userData.last_name
              },
              success: function (data){
                  location.reload();
              }
          });
        }

</script>

<cfinclude  template = "include/footer.cfm"  runOnce = "true">          
