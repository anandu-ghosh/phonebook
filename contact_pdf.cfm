<cfdocument format="PDF" filename="file.pdf" overwrite="Yes">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Hello World</title>
</head>
<body>
    <cfinvoke component="cfc.userdata"  method="selectContact" returnvariable="userData">
                <table class="table" >
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">Name</th>
      <th scope="col">Email Id</th>
      <th scope="col">Phone Number</th>
      <th scope="col">Address</th>
      <th scope="col">Gender</th>
      <th scope="col">DOB</th>
    </tr>
  </thead>
  <tbody>
  <cfoutput query="userData">
    <tr>
      <th scope="row"><img src="#userData.image#" width="80px" height="80px"></th>
      <td>#userData.fname# #userData.lname#</td>
      <td>#userData.email#</td>
      <td>#userData.phone#</td>
      <td>#userData.address#, #userData.street# </td>
      <td>#userData.gender#</td>
      <td>#userData.dob#</td>
     </tr>
    </cfoutput> 
    </tbody>
    </table>
</body>
</html>
</cfdocument>
<cfheader name="Content-Disposition" value="attachment;filename=file.pdf">
<cfcontent type="application/octet-stream" file="#expandPath('.')#\file.pdf" deletefile="Yes">