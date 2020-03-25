@RestResource(urlMapping='/Account/*')
global with sharing class MyRestResource {
  
    global static void getRecord() {
        system.debug('API');
       future2.test2();
    }
}