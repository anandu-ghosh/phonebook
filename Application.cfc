<cfcomponent>
    <cfset this.name = "PhoneBook App">
    <cfset this.sessionManagement = "true">
    <cfset this.loginStorage = "session">
    <cfset this.sessionTimeout = "#createTimespan(0,0,45,0)#">
    <cfset this.datasource = "coldfusion">
    <cfset this.ormEnabled = true>
    <cfset this.ormsettings = {}>
    <cfset this.invokeImplicitAccessor = true>
</cfcomponent>