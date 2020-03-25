global class GovSGApi {

static String failureResponseCode = 'CEA check failed on ';

public static String callCEAEndpoint (){
HttpResponse res;
Http http = new Http();
HttpRequest req = new HttpRequest();
req.setTimeout(30);
String finalResponse = 'Agent Name : <agentName> \n' +
'Agency Info : <agencyName>(<agencyLicense>) \n' +
'Registration end date : <endDate> \n';

Account account = new Account();
String RootEndpoint;

if (runningInASandbox()) {
RootEndpoint = 'http://dummy.restapiexample.com/api/v1/employees';
}
else{
RootEndpoint ='http://dummy.restapiexample.com/api/v1/employees';
}



req.setEndpoint(RootEndpoint);
req.setMethod('GET');
req.setHeader('Cache-Control', 'no-cache');
req.setHeader('Content-Type', 'application/json');

if(Test.isRunningTest()) {
//String resString = '{ "help": "https://data.gov.sg/api/3/action/help_show?name=datastore_search", "success": true, "result": { "resource_id": "a41ce851-728e-4d65-8dc5-e0515a01ff31", "fields": [ { "type": "int4", "id": "_id" }, { "type": "text", "id": "salesperson_name" }, { "type": "text", "id": "registration_no" }, { "type": "text", "id": "registration_start_date" }, { "type": "text", "id": "registration_end_date" }, { "type": "text", "id": "estate_agent_name" }, { "type": "text", "id": "estate_agent_license_no" }, { "type": "int8", "id": "_full_count" }, { "type": "float4", "id": "rank" } ], "q": "CEACHECK1", "records": [ { "registration_end_date": "2019-12-31", "estate_agent_license_no": "AGENCYCEA1", "salesperson_name": "UNIT TEST CEA CHECK", "registration_no": "CEACHECK1", "rank": 0.0573088, "_full_count": "1", "registration_start_date": "2013-11-27", "estate_agent_name": "UNIT TEST AGENCY", "_id": 29498 } ], "_links": { "start": "/api/action/datastore_search?q=R017154B&resource_id=a41ce851-728e-4d65-8dc5-e0515a01ff31", "next": "/api/action/datastore_search?q=R017154B&offset=100&resource_id=a41ce851-728e-4d65-8dc5-e0515a01ff31" }, "total": 1 }}';
res = new HttpResponse();
res.setStatusCode(200);
//res.setBody(resString);
} else {
system.debug('Gov SG CEA check endpoint :' + req.toString());
res = http.send(req);
System.debug('Gov SG CEA check API response : ' + res.getBody());
}
if(res.getStatusCode() == 200){
System.debug('CEA check performed succesfully');
map<String, object> responseJson = (map<String, object>)JSON.deserializeUntyped(res.getBody());
System.debug('Gov SG CEA whole response ' + responseJson);
List<Object> records = (List<Object>)((Map<String,Object>)responseJson.get('result')).get('records');

if(records.size() > 0) {
// System.debug('Gov SG CEA record present for ' + ceaNumber);
Map<String, Object> ceaRecord = (Map<String, Object>)records[0];
if(true) {
finalResponse = finalResponse.replace('<agentName>',(string)ceaRecord.get('salesperson_name'))
.replace('<agencyName>',(String)ceaRecord.get('estate_agent_name'))
.replace('<agencyLicense>',(String)ceaRecord.get('estate_agent_license_no'))
.replace('<endDate>', (String)ceaRecord.get('registration_end_date'));
if(Test.isRunningTest()) {
finalResponse = finalResponse + 'Last checked on : today';
} else {
DateTime dt = system.now();
finalResponse = finalResponse + 'Last checked on : ' + dt.format('dd/MM/YYYY HH:mm:ss', 'Asia/Singapore');
}
system.debug('final Response' + finalResponse);
}
else {
DateTime dt = system.now();
finalResponse = failureResponseCode + dt.format('dd/MM/YYYY HH:mm:ss', 'Asia/Singapore');
}
} else {
// System.debug('Gov SG CEA record not present for ' + ceaNumber);
DateTime dt = system.now();
finalResponse = failureResponseCode + dt.format('dd/MM/YYYY HH:mm:ss', 'Asia/Singapore');
}
} else {
System.debug('CEA check failed with ' + res.getStatusCode());
DateTime dt = system.now();
finalResponse = failureResponseCode + dt.format('dd/MM/YYYY HH:mm:ss', 'Asia/Singapore');
}

return finalResponse;
}

public static Boolean runningInASandbox() {
return [SELECT IsSandbox FROM Organization LIMIT 1].IsSandbox;
}



}