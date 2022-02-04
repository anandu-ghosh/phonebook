<cfcomponent persistent="true">
    <cffunction name="loginData" access="remote" >

        <cfargument name="username" type="string"  />
        <cfargument name="password" type="string"  />

        <cfif arguments.username eq "">
            <cfset variable = "Please fill the Username">
            <cfreturn variable>
        </cfif>

        <cfif arguments.password eq "">
            <cfset variable = "Please fill the Password field">
            <cfreturn variable>
        </cfif>

        <cfquery  datasource="coldfusion" result="outputdata" name="loginQuery">
            SELECT * FROM contact_book_user WHERE username= <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.username#"> AND password=<cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.password#"> AND status=1
        </cfquery>

        <cfif outputdata.RECORDCOUNT GT 0>
            <cfset Session.userId = loginQuery.id>
            <cfset Session.loggedin = true />
            <cfif Session.loggedin eq true>
                <cflocation url="../Panel.cfm" >
            </cfif> 
        <cfelse>
            <cfoutput>
            <cfset variable = "Please enter correct username and password">
                <cfreturn variable>
            </cfoutput>
        </cfif>

    </cffunction>

    <cffunction  name="googleLogin" access="public">
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
                <cfset Session.logwith = "google" />      
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
            </cfif> 

    </cffunction>

    <cffunction  name="facebookLogin" access="remote">
        <cfargument name="email" type="string" required="true" />
        <cfargument name="first_name" type="string" required="true" />
        <cfargument name="last_name" type="string" required="true" />

        <cfquery  datasource="coldfusion" result="outputquery" name="checkquery">
            SELECT * FROM contact_book_user WHERE email=<cfqueryparam CFSQLType="cf_sql_varchar" value="#email#">
        </cfquery>

            <cfif outputquery.RECORDCOUNT GT 0>
                <cfset Session.userId = checkquery.id>
                <cfset Session.loggedin = true />
                <cfset Session.logwith = "facebook" />
                <cflocation  url="../panel.cfm" addtoken="false">    
            <cfelse>
                <cfquery datasource="coldfusion" result="result">
                    INSERT INTO contact_book_user (fullname, email, username, password) VALUES (
                        <cfqueryparam value="#first_name#" CFSQLType="cf_sql_varchar">, 
                        <cfqueryparam value="#email#" CFSQLType="cf_sql_varchar">, 
                        <cfqueryparam value="#email#" CFSQLType="cf_sql_varchar">, 
                        <cfqueryparam value="">)
                </cfquery>
                <cfset Session.userId = result.generatedkey>
                <cfset Session.loggedin = true />
                <cfset Session.logwith = "facebook" />
                <cflocation  url="../panel.cfm" addtoken="false">
            </cfif> 

    </cffunction> 

</cfcomponent>