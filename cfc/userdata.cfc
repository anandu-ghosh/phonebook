<cfcomponent displayname="userdata" hint="Data from user side">

    <cffunction name="selectuserinformation" access="public" >
        <cfquery name="usersData" datasource="coldfusion">
            SELECT * FROM contact_book_user WHERE id= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#Session.userId#">
        </cfquery>
        <cfreturn usersData>
    </cffunction>

    <cffunction  name="createContact" access="remote">
        
        <cfargument name="title" type="string"/>
        <cfargument name="fname" type="string"/>
        <cfargument name="lname" type="string"/>
        <cfargument name="gender" type="string"/>
        <cfargument name="dob" type="string"/>
        <cfargument name="address" type="string"/>
        <cfargument name="street" type="string"/>
        <cfargument name="email" type="string"/>
        <cfargument name="phone" type="string"/>

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
    
            <cfset CreateContact = entityNew("contacts", {UserId : Session.userId, Title : arguments.title, FirstName : arguments.fname, LastName : arguments.lname, Gender : arguments.gender, DateBirth : arguments.dob, Image : img, Address : arguments.address, Street : arguments.street, Email : arguments.email, Phone : arguments.phone})>
            <cfset entitySave(CreateContact)>  
            <cflocation url="../panel.cfm" addtoken="no">
    </cffunction>

    <cffunction  name="selectContact" access="public">
     <cfquery name="usersData" datasource="coldfusion">
            SELECT * FROM contact_number WHERE user_id= #Session.userId#
        </cfquery>
        <cfreturn usersData>
    </cffunction>


    <cffunction  name="updateContact" access="remote">
        <cfargument name="title" type="string"/>
        <cfargument name="fname" type="string"/>
        <cfargument name="lname" type="string"/>
        <cfargument name="gender" type="string"/>
        <cfargument name="dob" type="date"/>
        <cfargument name="address" type="string"/>
        <cfargument name="street" type="string"/>
        <cfargument name="email" type="string"/>
        <cfargument name="phone" type="string"/>
        <cfargument name="old_file" type="string"/>
        <cfargument name="id" type="integer"/>

        <cfif form.file != "">
            <cffile action="upload"
                fileField="file"
                destination="F:\ColdFusion2021\cfusion\wwwroot\phonebook\assets\userImage"
                nameconflict="makeunique"
                result="img">
            <cfset img = "assets/userImage/#img.clientFile#">
        <cfelse>
            <cfset img = "#arguments.old_file#">
        </cfif>

        <cfquery datasource="coldfusion">
                UPDATE contact_number 
                SET title = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.title#">, 
                    fname = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.fname#">,
                    lname = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.lname#">,
                    gender = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.gender#">,
                    dob = <cfqueryparam CFSQLType="cf_sql_date" value="#arguments.dob#">,
                    image = <cfqueryparam CFSQLType="cf_sql_varchar" value="#img#">,
                    address = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.address#">,
                    street = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.street#">,
                    email = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.email#">,
                    phone = <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.phone#">,
                WHERE id = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.id#"> 
        </cfquery>
         <cflocation url="../panel.cfm" >
    </cffunction>

    <cffunction  name="deleteUser" access="public">
        <cfargument name="userId" type="any" required="true" />

        <cfquery datasource="coldfusion" name="delete_page">
            DELETE 
            FROM contact_number
            WHERE id = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#userId#">
        </cfquery>

        <cfreturn>
    </cffunction>

</cfcomponent>