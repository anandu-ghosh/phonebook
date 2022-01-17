<cfif StructKeyExists(session, "loggedin") >
    <cfinclude  template = "include/header.cfm"  runOnce = "true">


    <cfinclude  template = "include/footer.cfm"  runOnce = "true">
<cfelse>
    <cflocation url="./index.cfm" >
</cfif>