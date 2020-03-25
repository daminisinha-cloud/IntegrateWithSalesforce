public class googledriveIntegration {
    private string key = '127299168653-72ksof6sgmvaf3lf9qbeq66vidkidkic.apps.googleusercontent.com';
    private string secret = 'aUhPqhDM1cC2myFFYvWF1Nzn';
    private Integer expiresIn; 
    private String tokentype;
    private string redirect_uri = 'https://' + System.URL.getSalesforceBaseUrl().getHost()+'/apex/googleDriveTest'; 
    private string codetoken;
    private string accesstoken;
    private list<string> filelist;
    private map<string,string> fetchmap;
    public PageReference DriveAuth(){
        system.debug(redirect_uri);
        PageReference pg = new PageReference(GoogleDriveAuthUri(key, redirect_uri));
        return pg;
    }
    public googledriveIntegration(){
        String acctoken;
        filelist = new list<string>();
        fetchmap = new map<string,string>();
        codetoken = ApexPages.currentPage().getParameters().get('code');
        if (codetoken != '' || codetoken != null) {
            acctoken = AccessToken();
        }
        if(acctoken !='' ||acctoken !=null){
            FilesFetch();
        }
    }
    public string GoogleDriveAuthUri(String clientkey,String redirecturi){
        String authuri = '';
        String key = EncodingUtil.urlEncode(clientkey, 'UTF-8');
        String uri = EncodingUtil.urlEncode(redirecturi, 'UTF-8');
        authuri = 'https://accounts.google.com/o/oauth2/v2/auth?'+
            'client_id='+key+
            '&response_type=code'+
            '&scope=https://www.googleapis.com/auth/drive https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/drive https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/drive.metadata'+
            '&redirect_uri='+uri+
            '&state=security_token%3D138r5719ru3e1%26url%3Dhttps://oauth2-login-demo.example.com/myHome&'+
            '&login_hint=jsmith@example.com&'+
            'access_type=offline';
        return authuri;
    }
    public String AccessToken() {
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setEndpoint('https://accounts.google.com/o/oauth2/token');
        req.setHeader('content-type', 'application/x-www-form-urlencoded');
        String messageBody = 'code=' + codetoken + '&client_id=' + key + '&client_secret=' + secret + '&redirect_uri=' + redirect_uri + '&grant_type=authorization_code';
        req.setHeader('Content-length', String.valueOf(messageBody.length()));
        req.setBody(messageBody);
        req.setTimeout(60 * 1000);
        Http h = new Http();
        String resp;
        HttpResponse res = h.send(req);
        resp = res.getBody();
        JSONParser parser = JSON.createParser(resp);
        while (parser.nextToken() != null) {
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)) {
                String fieldName = parser.getText();
                parser.nextToken();
                if (fieldName == 'access_token') {
                    accesstoken = parser.getText();
                } else if (fieldName == 'expires_in') {
                    expiresIn = parser.getIntegerValue();
                } else if (fieldname == 'token_type') {
                    tokentype = parser.getText();
                }
            } 
        }
        System.debug(' You can parse the response to get the access token ::: ' + resp);
        return accesstoken;
    }
    public void FilesFetch(){
        googledrive__c gobj = [select folderId__c from googledrive__c where name='foldername'];
        string folderId = gobj.folderId__c;
        system.debug('folderId'+folderId);
        HttpRequest req1 = new HttpRequest();
        req1.setMethod('GET');
        req1.setEndpoint( 'https://www.googleapis.com/drive/v3/files');
        req1.setHeader('content-type', 'application/x-www-form-urlencoded');
        req1.setHeader('Authorization', 'Bearer ' + accesstoken);
        req1.setHeader('Content-length', '0');
        req1.setTimeout(60*1000);
        Http h = new Http();
        HttpResponse response = h.send(req1);
        system.debug('Files'+response);
        system.debug('Filesbody'+response.getBody());
        JSONParser parser = JSON.createParser(response.getBody());
        List<String> fieldList = new List<String>();
        while(parser.nextToken() != null){
            String id ='';
            String name = '';
            if((parser.getCurrentToken() == JSONToken.FIELD_NAME)){
                if((parser.getText() == 'id')){
                    parser.nextToken();
                    id = parser.getText();
                    system.debug('id '+id);
                }
                if((parser.getText() == 'name')){
                    parser.nextToken();
                    name = parser.getText();
                    system.debug('name '+name);
                }
            }
            fetchmap.put(id,name); 
        }
        system.debug('fetchmap'+fetchmap);    
    }
}