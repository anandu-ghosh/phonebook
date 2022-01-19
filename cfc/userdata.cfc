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
        <cfquery datasource="coldfusion">
            INSERT INTO contact_number (user_id, title, fname, lname, gender, dob, image, address, street, email, phone) VALUES (<cfqueryparam value="#Session.userId#">, <cfqueryparam value="#form.title#">, <cfqueryparam value="#form.fname#">, <cfqueryparam value="#form.lname#">, <cfqueryparam value="#form.gender#">, <cfqueryparam value="#form.dob#">, <cfqueryparam value="#img#">, <cfqueryparam value="#form.address#">, <cfqueryparam value="#form.street#">, <cfqueryparam value="#form.email#">, <cfqueryparam value="#form.phone#">)
        </cfquery>

        <cflocation url="./panel.cfm" >
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

</cfcomponent>