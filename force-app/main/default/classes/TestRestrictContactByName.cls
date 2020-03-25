@isTest
private class TestRestrictContactByName {
    @isTest static void contact_operation(){
        list<contact> con_list =new list<contact>();
        contact con= new contact(firstname='Damini',lastname ='INVALIDNAME');
        con_list.add(con); 
        contact con1= new contact(firstname='Damini',lastname ='NAME');
        con_list.add(con1);    
        
        Test.startTest();
        Database.SaveResult[] con_insert = Database.insert(con_list, false);
        Test.stopTest();
        database.SaveResult r0 = con_insert[0];
        database.SaveResult r1 = con_insert[1];
        
        System.assert(!r0.isSuccess());
        System.assert(r1.isSuccess());
        
        
        
        
    }
}