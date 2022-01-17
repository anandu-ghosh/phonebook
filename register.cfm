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
                                  <form method="post" name="registerForm" action="" onsubmit="return validateRegisterForm()">
                                      <div class="text-center d-flex flex-column"> <h1>Sign Up</h1></div>
                                      <div class="forms-inputs mb-5"><input name="fullName" class="text-field" autocomplete="off" type="text" placeholder="Full Name" />
                                      </div>
                                      <div class="forms-inputs mb-5">  <input name="emailId" class="text-field" autocomplete="off" type="email" placeholder="Email Id" />
                                      </div>
                                      <div class="forms-inputs mb-5">  <input name="userName" class="text-field" autocomplete="off" type="text" placeholder="Username" required/>
                                      </div>
                                      <div class="forms-inputs mb-5">  <input name="passWord" class="text-field" autocomplete="off" type="password" placeholder="Password" required/>
                                      </div>
                                      <div class="forms-inputs mb-5">  <input name="conformPassWord" class="text-field" autocomplete="off" type="password" placeholder="Conform Password" required/>
                                      </div>
                                      <div class="mb-3"> <button type="submit" name="registerButton" class="btn btn-main-page w-100 ">Sign Up</button> </div>
                                  </form>    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <cfif structKeyExists(form, "registerButton")>
                <cfinvoke component="cfc.register"  method="insertData" returnvariable="message">
                <cfoutput>#message#</cfoutput>
            </cfif>

      
<cfinclude  template = "include/footer.cfm"  runOnce = "true">