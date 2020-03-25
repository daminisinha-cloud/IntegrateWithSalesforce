({
    doInit : function(component, event, helper) {
        var action = component.get("c.fetchfields");
        action.setCallback(this,function(response){
            component.set("v.Fields",response.getReturnValue());
            console.log( component.get("v.Fields"));
            
        });
        $A.enqueueAction(action);
    }
})