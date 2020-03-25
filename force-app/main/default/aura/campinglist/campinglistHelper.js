({
	createItem : function(component,camping) {
		 var action = component.get("c.saveItem");
        action.setparams({"item": camping});
        action.setcallback(this,function(response){
                      var campings = component.get("v.items");
                campings.push(response.getReturnValue());
                component.set("v.items", campings);
                
                component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c',
                                               'Name': '',
                                               'Quantity__c': 0,
                                               'Price__c': 0,
                                               'Packed__c': false });
            }
        );
        $A.enqueueAction(action);
    },
	
})