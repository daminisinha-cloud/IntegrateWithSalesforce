global class LeadProcessor implements Database.Batchable<sobject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
              return Database.getQueryLocator([SELECT ID, name,company,status , leadsource FROM lead] 
              );}
        global void execute(Database.BatchableContext bc, List<lead> scope){
            list<lead> lead_list =new list<lead>();
            for(lead l: scope){
                l.leadsource= 'Dreamforce';
                lead_list.add(l);
            }
            update lead_list;
            }
        global void finish(Database.BatchableContext bc){
        
    }    
        }