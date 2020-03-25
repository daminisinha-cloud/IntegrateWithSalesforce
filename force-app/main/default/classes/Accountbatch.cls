global class Accountbatch implements database.Batchable<sObject>{
    
    global Iterable<sObject> start(Database.BatchableContext bc){
        list<Schema.FieldSetmember> fs1 = Schema.SObjectType.Account.fieldSets.getMap().get('batchfield').getFields();
        System.debug(fs1);
         string query1 ='select id';
        for(Schema.FieldSetmember f : fs1){
           query1 += ','+f.getFieldPath();
            
        }
        query1 += ' from account';
      
        return database.query(query1);
        
    }
    global void execute(Database.BatchableContext bc, list<account> records){
       list<account> acc_list = new list<account>();
        for(account acc: records){
            if(acc.AnnualRevenue<100)
                acc.Amount_status__c = label.accountaverageamount;
            else if(acc.AnnualRevenue>=50000)
                acc.Amount_status__c = label.accounthighamount ;
            else 
                acc.Amount_status__c = label.accountlowamount ;
             acc_list.add(acc);
            
        }
        update  acc_list;
    }
    global void finish(Database.BatchableContext bc){
        
    }
    
}