public class futuretest {
    @future
    public static void callanotherFuture(){
        system.debug('future1');
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://damini-cloud-dev-ed.my.salesforce.com/services/apexrest/Account/*/';
      
        RestContext.request = request;
        MyRestResource.getRecord();
     
    }
}