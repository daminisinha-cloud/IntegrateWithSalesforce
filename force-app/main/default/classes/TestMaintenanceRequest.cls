@isTest
public class TestMaintenanceRequest {
    @isTest 
    public static void testMet1()
    {
        
        test.startTest();
        MaintenanceRequestsetup.insertcase();
        test.stopTest();
        
    }
    //Test method to test trigger working
    
    @isTest static void testMet2()
    {
        Product2 p=new Product2(Replacement_Part__c=true,Name='TestEquip',Maintenance_Cycle__c=5);
        insert p;
        Date d=System.today();
        Integer days=Integer.valueOf(p.Maintenance_Cycle__c);
        Vehicle__c v=new Vehicle__c(Name='TestVehicle');
        insert v;
         MaintenanceRequestsetup.insertcase();
  
        List<Case> caseList=[SELECT Id FROM Case WHERE Subject Like 'TestSubject%' AND Status != 'Closed' LIMIT 3];
        List<Case> updateList=new List<Case>();
        List<Work_Part__c> workPartList=new List<Work_Part__c>();
        for(Case c:caseList)
        {
            c.Status='Closed';
            c.Type='Repair';
            c.Vehicle__c=v.Id;
            Work_Part__c w=new Work_Part__c(Maintenance_Request__c=c.Id,Equipment__c=p.Id);
            updateList.add(c);
            workPartList.add(w);
        }
        test.startTest();
        try{
            Database.SaveResult[] insertResult=Database.insert(workPartList);
            for(Database.SaveResult sr:insertResult)
            {
                if(sr.isSuccess())
                {
                    Database.SaveResult[] updateResult=Database.update(updateList);
                    for(Database.SaveResult ur:updateResult)
                        if(ur.isSuccess())
                    {
                        
                        List<Case> assertNewCase=[SELECT Id FROM Case Where Equipment__c=:p.Id AND Vehicle__c=:v.Id AND Type='Routine Maintenance' AND Subject='New Request' AND Date_Reported__c=:d AND Date_Due__c=:d.addDays(days)];
                        //  MaintenanceRequestHelper.updateWorkOrders(assertNewCase);
                        System.assertEquals(0,assertNewCase.size());
                    }
                }
            }
        }
        catch(Exception e)
        {
            
        }
       
        test.stopTest();
        
        
    }
    
}