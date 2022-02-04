component {

    this.name = "PhoneBook App";
    this.datasource = "coldfusion";
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0);
    this.ormEnabled = true;
    this.ormSettings = { logsql : true };

   function onRequestStart(requestname){ 

        if(!structKeyExists(session, "userId") or !structKeyExists(session, "loggedin") ){
            if(!(find("index",requestname) > 0 or find("register",requestname) > 0 or find("login",requestname) > 0 or find("google",requestname) > 0)){
               location("/phonebook/index.cfm",false);
            }
        }
        if(structKeyExists(session, "userId") or structKeyExists(session, "loggedin") ){
            if(!(find("panel",requestname) > 0 or find("contact_pdf",requestname) > 0 or find("contact_excel",requestname) > 0 or find("cfc/logout",requestname) > 0 or find("delete",requestname) > 0 or find("userdata",requestname) > 0)){
               location("/phonebook/panel.cfm",false);
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