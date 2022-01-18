<cfif StructKeyExists(session, "loggedin") >
    <cfinclude  template = "include/header.cfm"  runOnce = "true">

    <div class="container box-section">
        <div class="row d-flex justify-content-center">

            <div class="col-md-12 top-nav">
                <div class="navbar-expand">
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                        <div class="navbar-nav mr-auto mt-2 mt-lg-0"></div>
                        <div class="form-inline my-2 my-lg-0">
                            <a href="" class="my-sm-2 mr-sm-3"><i class="far fa-file-pdf"></i></a>
                            <a href="" class="my-sm-2 mr-sm-3"><i class="far fa-file-excel"></i></a>
                            <a href="" class="mr-sm-5"><i class="fas fa-print"></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3 side-profile  justify-content-center text-center">
                <cfinvoke component="cfc.userdata"  method="selectuserinformation" returnvariable="querydata">
                <img src="assets/img/pro.png" class="profile-section" />
               
                <h2 class="name-tag"><cfoutput>#querydata.fullname#</cfoutput></h2>

                <button class="col-8 contact-create-btn" data-toggle="modal" data-target="#exampleModal">Create Contact</button>
               
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-8 table-view">
            
                <table class="table">
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">Name</th>
      <th scope="col">Email Id</th>
      <th scope="col">Phone Number</th>
      <th scope="col"></th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>@mdo</td>
      <td>@mdo</td>
      <td>@mdo</td>
    </tr>
    
  </tbody>
</table>
            </div>
        </div>
    </div>


    <cfinclude  template = "contact_create.cfm"  runOnce = "true">
    <cfinclude  template = "include/footer.cfm"  runOnce = "true">
<cfelse>
    <cflocation url="./index.cfm" >
</cfif>