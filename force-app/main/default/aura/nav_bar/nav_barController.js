({
    doInit : function(cmp, event, helper) {
         console.log($A.get("$Browser.formFactor"));
        if($A.get("$Browser.formFactor")=='DESKTOP' ){
             cmp.set("v.collapse",'not collapse');
           }
       
    },
	ShowModuleBox : function(component, event, helper) {
		
	},
    
	newButtonsidebar : function(component, event, helper) {
		
	},
    
	forDeleteBoardRecord : function(component, event, helper) {
		
	},
    
	fetchGroupingFields : function(component, event, helper) {
		
	},
    button : function(component, event, helper) {
		
	},
})