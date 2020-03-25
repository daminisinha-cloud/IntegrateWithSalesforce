({
	 doInit: function(component, event, helper) {
        
        var action = component.get("c.getaccount");
       action.setParams({"acc_id": component.get("v.recordid")});
        action.setCallback(this, function(response) {
            var state = response.getState();
              console.log( response.getReturnValue());
              console.log( response.getReturnValue()[0].Contacts);
            if (state === "SUCCESS") {

                component.set("v.account", response.getReturnValue());
                component.set("v.conlist", response.getReturnValue()[0].Contacts);
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
     }
    
   
     })