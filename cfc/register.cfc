<cfcomponent>

    <cffunction name="insertData" access="remote">

        <cfargument name="fullName" type="string"  />
        <cfargument name="emailId" type="string" />
        <cfargument name="userName" type="string" />
        <cfargument name="passWord" type="string" />
        <cfargument name="conformPassWord" type="string" />

        <cfif arguments.fullName eq "">
            <cfset variable = "Please fill the name">
            <cfreturn variable>
        </cfif>

        <cfif arguments.emailId eq "" >
            <cfset variable = "Please fill the Email field">
            <cfreturn variable>
        </cfif>

        <cfif arguments.userName eq "">
            <cfset variable = "Please fill the Username field">
            <cfreturn variable>
        </cfif>

        <cfif arguments.passWord neq arguments.conformPassWord>
            <cfset variable = "Please fill the password and conform password as same">
            <cfreturn variable>
        </cfif>

        <cfquery name="emailcheck" datasource="coldfusion">
            select email 
            from contact_book_user
            where email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.emailId#" >
        </cfquery>
        
        <cfif emailcheck.recordcount >
            <cfset variable = "already existing this email">
            <cfreturn variable>
        <cfelse>
            <cfquery datasource="coldfusion" result="result">
                INSERT INTO contact_book_user (fullname, email, username, password) VALUES (
                    <cfqueryparam value="#arguments.fullName#" cfsqltype="cf_sql_varchar">, 
                    <cfqueryparam value="#arguments.emailId#" cfsqltype="cf_sql_varchar">, 
                    <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar">, 
                    <cfqueryparam value="#arguments.passWord#" cfsqltype="cf_sql_varchar">)
            </cfquery>
            <cfif result.generatedkey>
                <cflocation url="../index.cfm" >
            <cfelse>
                <cfset variable = "Please try after some time...">
                <cfreturn variable>
            </cfif>
        </cfif>
    </cffunction>
</cfcomponent>