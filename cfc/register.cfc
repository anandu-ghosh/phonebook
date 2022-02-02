<cfcomponent displayname="register" hint="insert Data">
    <cffunction name="insertData" access="public" >

    <cfif form.fullName eq "">
        <cfset variable = "Please fill the name">
        <cfreturn variable>
    </cfif>

     <cfif form.emailId eq "" >
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

    <cfquery name="emailcheck" datasource="coldfusion">
        select email 
        from contact_book_user
        where email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.emailId#" >
    </cfquery>
    <cfif emailcheck.recordcount >
        <cfset variable = "already existing this email">
        <cfreturn variable>
    <cfelse>
        <cfquery datasource="coldfusion" result="result">
            INSERT INTO contact_book_user (fullname, email, username, password) VALUES (
                <cfqueryparam value="#form.fullName#" cfsqltype="cf_sql_varchar">, 
                <cfqueryparam value="#form.emailId#" cfsqltype="cf_sql_varchar">, 
                <cfqueryparam value="#form.userName#" cfsqltype="cf_sql_varchar">, 
                <cfqueryparam value="#form.passWord#" cfsqltype="cf_sql_varchar">)
        </cfquery>
        <cfif result.generatedkey>
             <cfset variable = "save the data">
            <cflocation url="./index.cfm" >
        <cfelse>
            <cfset variable = "Please try after some time...">
            <cfreturn variable>
        </cfif>
        
       
    </cfif>

    
    </cffunction>
</cfcomponent>