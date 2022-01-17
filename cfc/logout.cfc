<cfif url.id eq "logout">

 <cfset StructClear(Session)>
    <cflocation url="../index.cfm" >
</cfif>