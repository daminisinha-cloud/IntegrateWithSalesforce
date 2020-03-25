({
    doInit: function(component,event,helper){
        var action= component.get("c.getItems");
        action.setcallback(this,function(response){
                           component.set("v.items",response.getReturnValue());}
                          );
        $A.enqueueAction(action);
},
/* createcamping:function(component,event,helper){
    var newcamp = component.get("v.items");
    helper.createItem(component,newcamp);
},*/
    handleAddItem:function(component,event,helper){
        var action = component.get("c.saveItem");
           action.setParams({"item": newItem});
             action.setCallback(this, function(response){
             var campings = component.get("v.items");
                campings.push(response.getReturnValue());
                component.set("v.items", campings);
                 

                }

            );

            $A.enqueueAction(action);
	
    }})