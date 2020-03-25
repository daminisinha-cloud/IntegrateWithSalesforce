public class AnimalLocator {
    public static String getAnimalNameById(Integer id){
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        Http http = new Http();
        HttpResponse response = http.send(request);String name;
        if (response.getStatusCode() == 200){
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                         system.debug(results);
           
         Map<String, Object> animal = (Map<String, Object>)(results.get('animal'));
        System.debug(animal);
             name= (String)animal.get('name');
            System.debug(name);
            }return name;
    }
}