@istest
public class LeadProcessorTest {
@testsetup
    static void getlead(){
        list<lead> lead_list = new list<lead>();
        for(Integer i=0;i<200;i++){
           lead_list.add(new lead(lastname='lead'+i, status='open-not contacted',company ='ABC'));
        }
        insert lead_list;
    }
    @istest
    static void test(){
        Test.startTest();
        LeadProcessor obj = new LeadProcessor();
        Id batchId = Database.executeBatch(obj);
        Test.stopTest();
    }
    
}