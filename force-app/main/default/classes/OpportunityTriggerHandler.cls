public class OpportunityTriggerHandler {
    public static void OnAfterInsert(List<opportunity> opp_list ){
        List<account> acc_list = new list<account>();
        Set<ID> acc_id = new Set<ID>();
        for(Opportunity opp: opp_list)
        {
            if(opp.accountid != null)
                acc_id.add(opp.accountid);
        }
        for( Account obj: [SELECT  top_opportunity__c,(SELECT id, Amount FROM opportunities WHERE stagename ='Closed won' ORDER BY Amount Desc LIMIT 1) FROM Account WHERE ID IN :acc_id ]){
            System.debug(obj.opportunities[0].id);
            // account new_acc = new account(id= obj.id);
            if(!obj.opportunities.isempty()) {
                obj.top_opportunity__c = obj.opportunities[0].id;
                acc_list.add(obj) ;
                System.debug(obj.top_opportunity__c);}
            else
                obj.top_opportunity__c = null;
        }
        if(!acc_list.isempty())
            update acc_list;
    }
    public static void OnAfterUpdate( List<opportunity> opp_list , map<ID,opportunity> oldmap){
        List<account> acc_list = new list<account>();
        Set<ID> acc_id = new Set<ID>();
        for(Opportunity opp: opp_list) {
            if(opp.accountid != oldmap.get(opp.id).accountid && opp.accountid!=null)
                acc_id.add(oldmap.get(opp.id).accountid);
            acc_id.add(opp.accountid);
        } 
        for( Account obj: [SELECT ID,top_opportunity__c ,(SELECT Amount , Stagename FROM opportunities WHERE stagename ='Closed won' ORDER BY Amount Desc LIMIT 1) FROM Account WHERE ID IN :acc_id ]){
            
            account new_acc = new account(id= obj.id);
            if(!obj.opportunities.isempty()) {
                new_acc.top_opportunity__c = obj.opportunities[0].id;  
                acc_list.add(new_acc) ;
            }
            else 
                new_acc.top_opportunity__c= null;      
        }
        if(!acc_list.isempty())
            update acc_list;}
}