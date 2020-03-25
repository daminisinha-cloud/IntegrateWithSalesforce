({ 
    createItem: function(component, newItem) {
 var createItem = component.getEvent("addItem");
   createItem.setParams({ "item": item });
        createItem.fire();
        component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '',
                                        'Quantity__c': 0,
                                        'Price__c': 0,
                                        'Packed__c': false });}

    
})