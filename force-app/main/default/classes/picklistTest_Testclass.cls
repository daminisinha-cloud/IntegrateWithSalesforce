@isTest
public class picklistTest_Testclass {
@isTest
    public static void testobjectlist(){
        picklist__c obj = new picklist__c();
        obj.name='Account';
        insert obj;
      picklistTest.objectlist();
         picklistTest.childlist('Account');
        
    }
}