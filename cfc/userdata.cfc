<cfcomponent displayname="userdata" hint="Data from user side">

    <cffunction name="selectuserinformation" access="public" >
        <cfquery name="usersData" datasource="coldfusion">
            SELECT * FROM contact_book_user WHERE id= #Session.userId#
        </cfquery>
        <cfreturn usersData>
    </cffunction>

    <cffunction  name="createContact" access="public">




<cfif form.file != "">
            <cffile action="upload"
                fileField="file"
                destination="F:\ColdFusion2021\cfusion\wwwroot\phonebook\assets\userImage"
                nameconflict="makeunique"
                result="img">
            <cfset img = "assets/userImage/#img.clientFile#">
        <cfelse>
            <cfset img = "">
        </cfif>
    
            <cfset CreateContact = entityNew("contacts", {UserId : Session.userId, Title : form.title, FirstName : form.fname, LastName : form.lname, Gender : form.gender, DateBirth : form.dob, Image : img, Address : form.address, Street : form.street,
            Email : form.email, Phone : form.phone})>
            <cfset entitySave(CreateContact)>  
            <cflocation url="panel.cfm" addtoken="no">

    </cffunction>

    <cffunction  name="selectContact" access="public">
     <cfquery name="usersData" datasource="coldfusion">
            SELECT * FROM contact_number WHERE user_id= #Session.userId#
        </cfquery>
        <cfreturn usersData>
    </cffunction>


    <cffunction  name="updateContact" access="public">
        <cfif form.file != "">
            <cffile action="upload"
                fileField="file"
                destination="F:\ColdFusion2021\cfusion\wwwroot\phonebook\assets\userImage"
                nameconflict="makeunique"
                result="img">
                <cfset img = "assets/userImage/#img.clientFile#">
        <cfelse>
            <cfset img = "#form.old_file#">
        </cfif>

        <cfquery datasource="coldfusion">
                UPDATE contact_number 
                SET title = '#form.title#', 
                    fname = '#form.fname#',
                    lname = '#form.lname#',
                    gender = '#form.gender#',
                    dob = '#form.dob#',
                    image = '#img#',
                    address = '#form.address#',
                    street = '#form.street#',
                    email = '#form.email#',
                    phone = '#form.phone#'
                WHERE id = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#form.id#"> 
        </cfquery>
         <cflocation url="./panel.cfm" >
    </cffunction>

    <cffunction  name="deleteUser" access="public">
        <cfargument name="userId" type="any" required="true" />

        <cfquery datasource="coldfusion" name="delete_page">
            DELETE 
            FROM contact_number
            WHERE id = #userId#
        </cfquery>

        <cfreturn>
    </cffunction>

</cfcomponent>