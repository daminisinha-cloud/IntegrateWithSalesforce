public class Fieldsettrialapex {
    @AuraEnabled
    public static  List<String> fetchfields(){
        Schema.DescribeSObjectResult r = lead.sObjectType.getDescribe();
        System.debug('r'+r);
         System.debug('r.fields.getMap()'+r.fields.getMap());
        List<String>apiNames =  new list<String>();
        for(string apiName : r.fields.getMap().keySet()){
            apiNames.add(apiName);
        }
        System.debug(apiNames);
        return apiNames;
    }
}