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
        }else{
                location("/phonebook/panel.cfm",false);
        }
    }

}