/*trigger AccountTrigger on Account (before insert , before update){
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate ){
            for( account a : trigger.new){
                if(a.Match_Billing_Address__c==true && a.BillingPostalCode!=null)
                    a.ShippingPostalCode= a.BillingPostalCode;
            }   
        }
    }
}*/
trigger AccountTrigger on Account (before insert){
     if(Trigger.isBefore && Trigger.isInsert){
      
             AccountTriggerHandler.CreateAccounts(Trigger.new);
                 
         
     }
}