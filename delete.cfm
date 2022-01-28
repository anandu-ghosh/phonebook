<cfif IsDefined("url.id")>
    <cfinvoke component="cfc.userdata" method="deleteUser" returnvariable="process" userId=#url.id# />
    <cflocation url="panel.cfm"/>
<cfelse>
    <cflocation url="panel.cfm"/>
</cfif>