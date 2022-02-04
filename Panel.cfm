<cfinclude  template = "include/header.cfm"  runOnce = "true">
<div class="container box-section">
   <div class="row d-flex justify-content-center">
      <div class="col-md-12 top-nav">
         <div class="navbar-expand">
            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
               <div class="navbar-nav mr-auto mt-2 mt-lg-0"></div>
               <div class="form-inline my-2 my-lg-0">
                  <a href="contact_pdf.cfm" class="my-sm-2 mr-sm-3"><i class="far fa-file-pdf"></i></a>
                  <a href="contact_excel.cfm" class="my-sm-2 mr-sm-3"><i class="far fa-file-excel"></i></a>
                  <button onclick="printDiv('tableDataView')" class="mr-sm-5"><i class="fas fa-print"></i></button>
               </div>
            </div>
         </div>
      </div>
      <div class="col-md-3 side-profile  justify-content-center text-center">
         <cfinvoke component="cfc.userdata"  method="selectuserinformation" returnvariable="querydata">
         <img src="assets/img/pro.png" class="profile-section" />
         <h2 class="name-tag">
            <cfoutput>#querydata.fullname#</cfoutput>
         </h2>
         <button class="col-8 contact-create-btn" data-toggle="modal" data-target="#exampleModal">Create Contact</button>
      </div>
      <div class="col-md-1"></div>
      <div class="col-md-8 table-view" id="tableDataView">
         <cfinvoke component="cfc.userdata"  method="selectContact" returnvariable="userData">
         <table class="table" >
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
               <cfoutput query="userData">
                  <tr>
                     <th scope="row"><img src="#userData.image#" width="100px" height="100px" style="border-radius:50%"></th>
                     <td>#userData.fname# #userData.lname#</td>
                     <td>#userData.email#</td>
                     <td>#userData.phone#</td>
                     <td><button class="btn btn-primary" data-toggle="modal" data-target=".exampleModal-#userData.id#" >Edit</button></td>
                     <td><a href="delete.cfm?id=#userData.id#" class="btn btn-primary">Delete</a></td>
                     <td><button class="btn btn-primary" data-toggle="modal" data-target=".viewModal-#userData.id#">View</button></td>
                     <div class="modal fade bd-example-modal-lg exampleModal-#userData.id#" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                 <span aria-hidden="true">&times;</span>
                                 </button>
                              </div>
                              <div class="modal-body">
                                 <form method="post" action="cfc/userdata.cfc?method=updateContact" enctype="multipart/form-data" >
                                    <div class="row">
                                       <div class="col-md-12">
                                          <h3>Personal Contact</h3>
                                          <hr>
                                       </div>
                                       <div class="col-md-2">
                                          <label  for="tittle">Title*</label>
                                          <select  name="title" class="form-control" id="title" required>
                                             <option value="">Select</option>
                                             <option <cfif userData.title eq "Mr" >selected</cfif> value="Mr">Mr</option>
                                             <option <cfif userData.title eq "Mrs" >selected</cfif> value="Mrs">Mrs</option>
                                             <option <cfif userData.title eq "Miss" >selected</cfif> value="Miss">Miss</option>
                                             <option <cfif userData.title eq "Ms" >selected</cfif> value="Ms">Ms</option>
                                          </select>
                                       </div>
                                       <div class="col-md-5">
                                          <label  for="firstName">First Name*</label>
                                          <input name="fname" value="#userData.fname#" type="text" id="firstName" class="form-control" required>
                                       </div>
                                       <div class="col-md-5">
                                          <label for="LastName">Last Name*</label>
                                          <input name="lname" value="#userData.lname#" type="text" id="LastName" class="form-control" required>
                                       </div>
                                    </div>
                                    <div class="row mt-4">
                                       <div class="col-md-6">
                                          <label for="gender">Gender*</label>
                                          <select name="gender" class="form-control" id="gender" required>
                                             <option value="">Select</option>
                                             <option <cfif userData.gender eq "male" >selected</cfif> value="male">Male</option>
                                             <option <cfif userData.gender eq "female" >selected</cfif> value="female">Female</option>
                                          </select>
                                       </div>
                                       <div class="col-md-6">
                                          <label for="DOB">Date Of Birth*</label>
                                          <input name="dob" value="#userData.dob#" type="date" id="DOB" class="form-control" required>
                                       </div>
                                    </div>
                                    <div class="row mt-4">
                                       <div class="col-md-6">
                                          <label for="pImage">Upload Photo</label>
                                          <input name="file" type="file" id="pImage" class="form-control" /><img src="#userData.image#" width="100px" height="100px" />
                                          <input type="hidden" name="old_file" value="#userData.image#" />
                                       </div>
                                    </div>
                                    <div class="row mt-4">
                                       <div class="col-md-12">
                                          <h3>Contact Details</h3>
                                          <hr>
                                       </div>
                                       <div class="col-md-6">
                                          <label for="address">Address</label>
                                          <input name="address" value="#userData.address#" type="text" id="address" class="form-control" />
                                       </div>
                                       <div class="col-md-6">
                                          <label for="street">Street</label>
                                          <input name="street" value="#userData.street#" type="text" id="street" class="form-control" />
                                       </div>
                                       <div class="col-md-6">
                                          <label for="email">Email*</label>
                                          <input name="email" value="#userData.email#" type="email" id="email" class="form-control" required/>
                                       </div>
                                       <div class="col-md-6">
                                          <label for="phone">Phone*</label>
                                          <input name="phone" value="#userData.phone#" type="text" id="phone" class="form-control" required/>
                                       </div>
                                    </div>
                                    <input type="hidden" name="id" value="#userData.id#" />
                              </div>
                              <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                              <button name="update_contact" type="submit" class="btn btn-primary">Save</button>
                              </div>
                              </form>
                           </div>
                        </div>
                     </div>
                     <div class="modal fade bd-example-modal-lg viewModal-#userData.id#"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-md" role="document">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                 <span aria-hidden="true">&times;</span>
                                 </button>
                              </div>
                              <div class="modal-body">
                                 <form method="post" action="" enctype="multipart/form-data" >
                                    <div class="row">
                                       <div class="col-md-12">
                                          <h3>Personal Contact</h3>
                                          <hr>
                                       </div>
                                       <div class="col-md-3">
                                          Name 
                                       </div>
                                       <div class="col-md-9">
                                          : #userData.title#  #userData.fname# #userData.lname#
                                       </div>
                                    </div>
                                    <div class="row mt-4">
                                       <div class="col-md-3">
                                          Gender 
                                       </div>
                                       <div class="col-md-9">
                                          : #userData.gender#
                                       </div>
                                    </div>
                                    <div class="row mt-4">
                                       <div class="col-md-3">
                                          DOB 
                                       </div>
                                       <div class="col-md-9">
                                          : #userData.dob#
                                       </div>
                                    </div>
                                    <div class="row mt-4">
                                       <div class="col-md-3">
                                          Address 
                                       </div>
                                       <div class="col-md-9">
                                          : #userData.address#, #userData.street#
                                       </div>
                                    </div>
                                    <div class="row mt-4">
                                       <div class="col-md-3">
                                          Email 
                                       </div>
                                       <div class="col-md-9">
                                          : #userData.email#
                                       </div>
                                    </div>
                                    <div class="row mt-4">
                                       <div class="col-md-3">
                                          Phone 
                                       </div>
                                       <div class="col-md-9">
                                          : #userData.phone#
                                       </div>
                                    </div>
                                    <div class="row mt-4">
                                       <div class="col-md-3">
                                          Image 
                                       </div>
                                       <div class="col-md-9">
                                          : <img src="#userData.image#" width="100px" height="100px" style="border-radius:50%">
                                       </div>
                                    </div>
                              </div>
                              <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                              </div>
                              </form>
                           </div>
                        </div>
                     </div>
                  </tr>
               </cfoutput>
            </tbody>
         </table>
      </div>
   </div>
</div>

<cfinclude  template = "contact_create.cfm"  runOnce = "true">
<script>
   function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;
   
    document.body.innerHTML = printContents;
   
    window.print();
   
    document.body.innerHTML = originalContents;
   }
</script>
<cfinclude  template = "include/footer.cfm"  runOnce = "true">