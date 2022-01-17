<cfcomponent displayname="register" hint="insert Data">
    <cffunction name="insertData" access="public" >

    <cfif form.fullName eq "">
        <cfset variable = "Please fill the name">
        <cfreturn variable>
    </cfif>

     <cfif form.emailId eq "">
        <cfset variable = "Please fill the Email field">
        <cfreturn variable>
    </cfif>

    <cfif form.userName eq "">
        <cfset variable = "Please fill the Username field">
        <cfreturn variable>
    </cfif>

    <cfif form.passWord neq form.conformPassWord>
        <cfset variable = "Please fill the password and conform password as same">
        <cfreturn variable>
    </cfif>

    <cfquery datasource="coldfusion">
        INSERT INTO contact_book_user (fullname, email, username, password) VALUES (<cfqueryparam value="#form.fullName#">, <cfqueryparam value="#form.emailId#">, <cfqueryparam value="#form.userName#">, <cfqueryparam value="#form.passWord#">)
    </cfquery>
         <cflocation url="./index.cfm" >
       <cfset variable = "save the data">
        <cfreturn variable>
    </cffunction>
</cfcomponent>