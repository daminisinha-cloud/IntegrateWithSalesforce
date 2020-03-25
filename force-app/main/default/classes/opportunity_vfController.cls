public class opportunity_vfController {
    public list<wrapper> wrapper_list{get;set;}
    public OpportunityContactRole contactRole{get;set;} 
    public Opportunity opp{get;set;}
    public List<Opportunity> oppList {get;set;}
    public List<OpportunityContactRole> conRoleList {get;set;}
    public List<OpportunityContactRole> conRoleList_wrapper =new List<OpportunityContactRole>();
    
    
    public opportunity_vfController(){
        opp = new Opportunity();	
        conRoleList = new List<OpportunityContactRole>();
        contactRole = new OpportunityContactRole();
        oppList = new list<opportunity>();
        wrapper_list = new list<wrapper>();
    }
    
    public class wrapper{
        public Opportunity opp_wra{get;set;}
        public List<OpportunityContactRole> conRoleList_wra {get;set;}
        
        public wrapper(opportunity  opportunities, list<opportunitycontactrole> conRoleList ){
            opp_wra =  opportunities;
            conRoleList_wra = new List<OpportunityContactRole>();
            conRoleList_wra.addall(conRoleList);
        }
    }
    public void ContactRole(){
        conRoleList.add(new OpportunityContactRole(contactid=Contactrole.ContactId, role= Contactrole.Role));
        Contactrole = new OpportunityContactRole();
    }
    public void opp_list(){
        wrapper_list.add(new wrapper( opp , conRoleList) );  
        opp = new Opportunity();	
        conRoleList = new List<OpportunityContactRole>();
        
    }
    public void save(){
        for(wrapper w : wrapper_list){
            oppList.add(w.opp_wra);
        }
        if(!oppList.isEmpty())
        insert oppList;
        for(wrapper w :  wrapper_list){
            for(OpportunityContactRole o : w.conRoleList_wra){
                o.OpportunityId = w.opp_wra.Id; 
                conRoleList_wrapper.add(o);
            }
        }  if(!conRoleList_wrapper.isEmpty())
        insert conRoleList_wrapper ;
    }
}