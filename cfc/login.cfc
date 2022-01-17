<cfcomponent displayname="login" hint="insert Data">
    <cffunction name="loginData" access="public" >

        <cfif form.username eq "">
            <cfset variable = "Please fill the Username">
            <cfreturn variable>
        </cfif>

        <cfif form.password eq "">
            <cfset variable = "Please fill the Password field">
            <cfreturn variable>
        </cfif>

        <cfquery  datasource="coldfusion" result="outputdata" name="loginQuery">
            SELECT * FROM contact_book_user WHERE username= "#form.username#" AND password="#form.password#" AND status=1
        </cfquery>


        <cfif outputdata.RECORDCOUNT GT 0>
                 <cfset Session.userId = loginQuery.id>
                 <cfset Session.loggedin = true />
                    <cfif Session.loggedin eq true>
                        <cflocation url="Panel.cfm" >
                    </cfif> 
        <cfelse>
            <cfoutput>
            <cfset variable = "Please enter correct username and password">
                <cfreturn variable>
            </cfoutput>
        </cfif>

    </cffunction>
</cfcomponent>