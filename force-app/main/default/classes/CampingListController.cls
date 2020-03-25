public class CampingListController {
@AuraEnabled
    public static list<Camping_Item__c> getItems(){
      list<Camping_Item__c> camlist= [Select id ,Packed__c,Price__c,Quantity__c from Camping_Item__c]; 
        return camlist;
    }
    @AuraEnabled
    public static Camping_Item__c  saveItem(Camping_Item__c  items){
       upsert items;
        return items;
    } 
}