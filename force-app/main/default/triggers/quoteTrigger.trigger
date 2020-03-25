trigger quoteTrigger on Quote (before insert) {
    if(Trigger.isBefore && Trigger.isInsert ){
        list<quote> quotelist = new list<quote>();
         map<String,Sales_Tax__c> salesTax_city=  new map< String,Sales_Tax__c>();
        for(Sales_Tax__c s:[Select id, Street__c,City__c from Sales_Tax__c]){
            salesTax_city.put(s.City__c,s);
        }
         for(quote q :trigger.new){
             if(salesTax_city.containsKey(q.BillingCity)){
                 if(q.BillingState==salesTax_city.get(q.BillingCity).Street__c)
              q.Sales_Tax__c = salesTax_city.get(q.BillingCity).id;}}
        }   
    }