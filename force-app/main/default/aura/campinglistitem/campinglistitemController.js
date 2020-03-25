({
	packItem: function(component, event, helper) {
		var item = component.get("v.item");
      
        component.set("v.item.Packed__c",true);
        var btnclicked = event.getsource();
        btnclicked.set("v.disabled",true);
        
        
        
	}
})