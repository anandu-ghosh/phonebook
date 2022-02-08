component {

    this.name = "PhoneBook App";
    this.datasource = "coldfusion";
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0);
    this.ormEnabled = true;
    this.ormSettings = { logsql : true };

   function onRequestStart(requestname){ 

        if(!structKeyExists(session, "userId") or !structKeyExists(session, "loggedin") ){
            if(!(FindNoCase("index",requestname) > 0 or FindNoCase("register",requestname) > 0 or FindNoCase("login",requestname) > 0 or FindNoCase("google",requestname) > 0)){
               location("/phonebook/index.cfm",false);
            }
        }
    }

    function onError(Exception,EventName){
        writeOutput('<center><h1>An error occurred</h1>
		<p>Please Contact the developer</p>
		<p>Error details: #Exception.message#</p></center>');
    }

    function onMissingTemplate(targetPage){
        writeOutput('<center><h1>This Page is not avilable.</h1>
		<p>Please go back:</p></center>');
    }


}