({
    handleEvent : function(component,event,helper){
         
       var com = event.getParams("bool")
       console.log(JSON.stringify(com.bool));
       component.set("v.bool",JSON.stringify(com.bool));
    },
    onsubmit : function(component,event,helper){
            var eventFields = event.getParam("fields");
          component.set("v.object",eventFields);
        console.log(component.get("v.object"))
    },
    cancel : function(component,event,helper){
    var com =component.set("v.bool",false); 
    },success : function(component,event,helper){
        
        var param = event.getParams().id;
        var obj = component.get("v.object");       
        Object.assign(obj, {Id: param});  
         var appEvent = $A.get("e.c:accountAppEvent"); 
        appEvent.setParams({"record" : obj }); 
        appEvent.fire(); 
        component.set("v.bool",false);        
      
    }
})