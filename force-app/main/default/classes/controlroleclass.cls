public class controlroleclass {
    public Opportunity opportunities{get;set;}
   public  List<OpportunityContactRole> ContactRoles{get;set;}
    
    public controlroleclass(){
        ContactRoles=[SELECT Contact.Name,contactid, Role
                FROM   
                    OpportunityContactRole];
       
    }
}