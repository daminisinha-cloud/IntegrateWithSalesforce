({
    selectRecord : function(component, event, helper){
        var b = component.get("v.bool");
        var rec = component.get("v.objname");
        component.set("v.recordId",rec.Id);
        console.log(rec);
        var compEvent = component.getEvent("Event1");                                          
        compEvent.setParams({"objname" : rec,
                             "bool"   : b
                            });   
        compEvent.fire();
    },
   
    editAccount : function(component, event, helper){
        component.set("v.bool",true);
        
    }
})