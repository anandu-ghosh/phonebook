component {

    this.name = "PhoneBook App";
    this.datasource = "coldfusion";
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0); //30 minutes
    this.ormEnabled = true;
    this.ormSettings = { logsql : true };

    // function onRequest( string targetPage ) {
    //     if(structKeyExists(session, "loggedin") == true){
    //         location("panel.cfm",false);
    //     }else{
    //         location("index.cfm",false);
    //     }     
    // }
}