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
                                    <form method="post" name="loginForm" action="" onsubmit="return validateLoginForm()">
                                        <div class="text-center d-flex flex-column"> <h1>Login</h1></div>
                                        <div class="forms-inputs mb-5"><input name="username" class="text-field" autocomplete="off" type="text" placeholder="Username"/>
                                        </div>
                                        <div class="forms-inputs mb-5">  <input name="password" class="text-field" autocomplete="off" type="password" placeholder="Password"/>
                                        </div>
                                        <div class="mb-3"> <button type="submit" name="loginButton" class="btn btn-main-page w-100 ">Login</button> </div>
                                    </form>    
                                </div>
                                <div class="success-data">
                                    <div class="text-center d-flex flex-column"> <i class='bx bxs-badge-check'></i> <span class="text-center fs-1">Or Sign in Using <br><form method="post"> <button type="submit" name="face-btn" class="social-btn"><i class="fab fa-facebook"></i></button> <button type="submit" name="google-btn" class="social-btn"><i class="fab fa-google-plus"></i></button></form><br>
                                    Don't have an account? <a href="">Register Here</a>
                                    </span> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <cfif structKeyExists(form, "loginButton")>
                <cfinvoke component="cfc.login"  method="loginData" returnvariable="message">
                <cfoutput>#message#</cfoutput>
        </cfif>

        <cfif structKeyExists(form, "google-btn")>
           
                <cflocation  url="cfc/google.cfm">
                        
                        
        </cfif>
        
<cfinclude  template = "include/footer.cfm"  runOnce = "true">          
