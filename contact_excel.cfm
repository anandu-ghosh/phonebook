<cfset q = queryNew("Name,Address,Gender,DOB,Email,Phone")> 
<cfinvoke component="cfc.userdata"  method="selectContact" returnvariable="userData">
	<cfoutput query="userData">
    <cfset fullname = userData.fname & ' ' &userData.lname />
    <cfset address = userData.address & ","& userData.street />
		<cfset queryAddRow(q)>
		<cfset querySetCell(q, "Name", fullname)>
		<cfset querySetCell(q, "Address", address)>
		<cfset querySetCell(q, "Gender", userData.gender)>
		<cfset querySetCell(q, "DOB", userData.dob)>
		<cfset querySetCell(q, "Email", userData.email)>
		<cfset querySetCell(q, "Phone", userData.phone)>
    </cfoutput>>
	
	<cfset filename = expandPath("./myexcel.xls")>
	<!---
	<cfspreadsheet action="write" query="q" filename="#filename#" overwrite="true">
	--->
	<!--- Make a spreadsheet object --->
	<cfset s = spreadsheetNew()>
	<!--- Add header row --->
	<cfset spreadsheetAddRow(s, "Name,Address,Gender,DOB,Email,Phone")>
	<!--- format header --->	
	<cfset spreadsheetFormatRow(s,
			{
				bold=true,
				fontsize=10
			}, 
			1)>
	
	<!--- Add query --->
	<cfset spreadsheetAddRows(s, q)>
<!---
	<cfset spreadsheetWrite(s, filename, true)>
		
	Your spreadsheet is ready. You may download it <a href="myexcel.xls">here</a>.
--->

	<cfheader name="content-disposition" value="attachment; filename=myexcel.xls">
	<cfcontent type="application/msexcel" variable="#spreadsheetReadBinary(s)#" reset="true">
