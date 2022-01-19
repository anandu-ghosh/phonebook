<cfif IsDefined("url.id")>

<cfquery datasource="coldfusion" name="delete_page">
    DELETE 
    FROM contact_number
    WHERE id = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#url.id#">
</cfquery>
<cflocation url="../panel.cfm"/>
<cfelse>
<cflocation url="../panel.cfm"/>
</cfif>