({
	doInit : function(component, event, helper) {
         var action = component.get("c.objectlist");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               component.set("v.picklist", response.getReturnValue());
                console.log(response.getReturnValue());
            }
           else {
                    console.log(" error");
                }
            }
        );

       
        $A.enqueueAction(action);
    },
    handleOnChange :function(component, event, helper) {
         var action = component.get("c.childlist");
    var pick_value= component.get("v.picklistvalue");
    console.log(pick_value);
   action.setParams({obj:pick_value});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               component.set("v.picklist2", response.getReturnValue());
                console.log(response.getReturnValue());
            }
           else {
                    console.log(" error");
                }
            }
        );

       
        $A.enqueueAction(action);
		
}	
})