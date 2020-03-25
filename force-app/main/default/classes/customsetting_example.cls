public class customsetting_example {
    public static void example(){
    picklist_setting__c obj =[Select id,name, email__c, title__c from picklist_setting__c];
        System.debug(obj);
    }
}