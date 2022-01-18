<cfcomponent displayname="userdata" hint="Data from user side">

    <cffunction name="selectuserinformation" access="public" >
        <cfquery name="usersData" datasource="coldfusion">
            SELECT * FROM contact_book_user WHERE id= #Session.userId#
        </cfquery>
        <cfreturn usersData>
    </cffunction>

</cfcomponent>