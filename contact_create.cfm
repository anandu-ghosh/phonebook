<div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
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
				<h3>Personal Contact</h3><hr>
			</div>
            <div class="col-md-2">
                <label  for="tittle">Title*</label>
                <select  name="title" class="form-control" id="title" required>
                    <option value="">Select</option>
                    <option value="Mr">Mr</option>
                    <option value="Mrs">Mrs</option>
                    <option value="Miss">Miss</option>
                    <option value="Ms">Ms</option>
                </select>
            </div>
            <div class="col-md-5">
                <label  for="firstName">First Name*</label>
                <input name="fname" type="text" id="firstName" class="form-control" required>
            </div>
            <div class="col-md-5">
                <label for="LastName">Last Name*</label>
                <input name="lname" type="text" id="LastName" class="form-control" required>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-6">
                <label for="gender">Gender*</label>
                <select name="gender" class="form-control" id="gender" required>
                    <option value="">Select</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                </select>
            </div>
            <div class="col-md-6">
                <label for="DOB">Date Of Birth*</label>
                <input name="dob" type="date" id="DOB" class="form-control" required>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-6">
                <label for="pImage">Upload Photo</label>
                <input name="file" type="file" id="pImage" class="form-control" />
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-12">
				<h3>Contact Details</h3><hr>
			</div>
            <div class="col-md-6">
                <label for="address">Address</label>
                <input name="address" type="text" id="address" class="form-control" />
            </div>
            <div class="col-md-6">
                <label for="street">Street</label>
                <input name="street" type="text" id="street" class="form-control" />
            </div>
            <div class="col-md-6">
                <label for="email">Email*</label>
                <input name="email" type="email" id="email" class="form-control" required/>
            </div>
            <div class="col-md-6">
                <label for="phone">Phone*</label>
                <input name="phone" type="text" id="phone" class="form-control" required/>
            </div>
        </div>
      
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button name="create_contact" type="submit" class="btn btn-primary">Save</button>
      </div>
      </form>
    </div>
  </div>
</div>

<cfif structKeyExists(form, "create_contact")>
  <cfinvoke component="cfc.userdata"  method="createContact" returnvariable="message">
</cfif>