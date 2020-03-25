public class hireFormhandler {
    public static void OnInsertOnperation(List<Hire_Form__c> hireForm){
        list<contact> con_list = new list<contact>();
        list<case> case_list = new list<case>();
        for(Hire_Form__c hf: hireForm){
            hf.Status__c = 'In Progress';
            con_list.add( new contact(firstname= hf.First_name__c, lastname =hf.Last_name__c, email = hf.Email__c, phone =hf.Phone__c ));
        }
        insert con_list ;
        integer i=0;
        for(Hire_Form__c hf: hireForm){
            hf.Candidate__c = con_list[i].id;
            case_list.add (new case(ContactId = con_list[i].id ,status ='new'));
            i++;
        }
        insert case_list;
    }
    public static void OnUpdateOperation(List<Hire_Form__c> hireForm) {
        Set<id> hf_id = new Set<id>();
        for(Hire_Form__c hf: hireForm){
            if(hf.Status__c == 'completed')
                hf_id.add(hf.Candidate__c);
        }
        list<case> hf_case = new list<case>([Select id, contactid , status from case where contactid IN : hf_id]);
        for( case c: hf_case){
            c.status='Closed';
        }
        update  hf_case;
    }
    public static void update_case(List<case> case_list){
        set<id> contact_ids = new Set<id>();
        for(case c : case_list) {
            if(c.status == 'closed')
                contact_ids.add(c.ContactId);}
        for( Hire_Form__c hf  : [select id, Status__c , Candidate__c from Hire_Form__c where  Candidate__c IN : contact_ids]) {
            if(hf.Status__c != 'comleted')
                hf.adderror('You can not close the case until hire form  is completed');
        }
    }
}