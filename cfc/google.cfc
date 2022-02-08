<cfcomponent persistent="true">
      <cffunction  name="googleLogin" access="remote">
            <cfoauth
            type="Google" 
            clientid="1016945913441-82je7j44217t7ame4atp8i4c0qh3k0hu.apps.googleusercontent.com" 
            scope="https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile"
            secretkey="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" 
            result="res"  
            redirecturi="http://127.0.0.1:8500/phonebook/google.cfm">

            <cfquery  datasource="coldfusion" result="outputquery" name="checkquery">
                SELECT * FROM contact_book_user WHERE email=<cfqueryparam CFSQLType="cf_sql_varchar" value="#res.other.email#">
            </cfquery>

            <cfif outputquery.RECORDCOUNT GT 0>
                <cfset Session.userId = checkquery.id>
                <cfset Session.loggedin = true />
                <cfset Session.logwith = "google" />   4
                <cflocation url ="http://127.0.0.1:8500/phonebook/panel.cfm">   
            <cfelse>
                <cfquery datasource="coldfusion" result="result">
                    INSERT INTO contact_book_user (fullname, email, username, password) VALUES (
                        <cfqueryparam value="#res.other.given_name#" CFSQLType="cf_sql_varchar">, 
                        <cfqueryparam value="#res.other.email#" CFSQLType="cf_sql_varchar">, 
                        <cfqueryparam value="#res.other.email#" CFSQLType="cf_sql_varchar">, 
                        <cfqueryparam value="">)
                </cfquery>
                <cfset Session.userId = result.generatedkey>
                <cfset Session.loggedin = true />
                <cfset Session.logwith = "google" /> 
                <cflocation url ="http://127.0.0.1:8500/phonebook/panel.cfm">
            </cfif> 

    </cffunction>
</cfcomponent>
