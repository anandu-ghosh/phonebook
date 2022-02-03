component {

    this.name = "PhoneBook App";
    this.datasource = "coldfusion";
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0); //30 minutes
    this.ormEnabled = true;
    this.ormSettings = { logsql : true };

   function onRequestStart(requestname){ 

        if(!structKeyExists(session, "userId") or !structKeyExists(session, "loggedin") ){
            if(!(find("index",requestname) > 0 or find("register",requestname) > 0 or find("google",requestname) > 0)){
               location("/phonebook/index.cfm",false);
            }
        }

        if(structKeyExists(session, "userId") or structKeyExists(session, "loggedin") ){
            if(!(find("panel",requestname) > 0 or find("contact_pdf",requestname) > 0 or find("contact_excel",requestname) > 0 or find("cfc/logout",requestname) > 0 or find("delete",requestname) > 0)){
               location("/phonebook/panel.cfm",false);
            }
        }
    }

    function onError(Exception,EventName){
        writeOutput('<h2>An unexpected error occurred.</h2>
		<p>Please Contact the developer</p>
		<p>Error : #EventName#</p>
		<p>Error details: #Exception.message#<br>');
		exit;
    }

    function onMissingTemplate(targetPage){
            writeOutput('<center><h2>This Page is not avilable.</h2>
		<p>Please go back:</p></center>');
		exit;
    }


}