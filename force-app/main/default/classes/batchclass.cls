global class batchclass implements Database.Batchable<sObject> {
   
    global  Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'Select Id, name from Account ';
        return database.getQueryLocator(query);    
    }
    global void execute(Database.BatchableContext bc,list<account> acc_list){
        list<Contact> con_list = new list<Contact>(); 
        for(account acc :acc_list){
            contact con = new contact(lastname='con'+acc.name, accountid =acc.id);
            con_list.add(con);
        }   
        Database.SaveResult[]  result = Database.insert(con_list,false); 
        for(Database.SaveResult sr :result){
            if(!sr.isSuccess()){
                for(Database.Error err : sr.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('contact fields that affected this error: ' + err.getFields());
                }  
            }
            
        }
        
    }
    
    
    global void finish(Database.BatchableContext bc){
    }
}