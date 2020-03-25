({
    doInit : function(cmp, event, helper) {
         console.log($A.get("$Browser.formFactor"));
        if($A.get("$Browser.formFactor")=='DESKTOP' ){
             cmp.set("v.collapse",'not collapse');
          
           }
       
    },
	ShowModuleBox : function(component, event, helper) {
		
	},
    
	forDeleteBoardRecord : function(component, event, helper) {
		
	},
    
	fetchGroupingFields : function(component, event, helper) {
		
	},
     newButtonsidebar : function(component, event, helper) {
         console.log("hello");
        component.set('v.isTrue',true);
        component.set('v.isGroup',false);
        component.set('v.isSave',true);
        component.set('v.isDelete',false);
        var cmpTarget = component.find('dropTemplateFieldId');
          var cmpTarget1 = component.find('filterDiv');
        $A.util.addClass(cmpTarget, 'slds-hide');
          if($A.get("$Browser.formFactor")=='DESKTOP' ){
              
              $A.util.addClass(cmpTarget1,'sidedesktop');
          
           }
         else{
             
              $A.util.addClass(cmpTarget1,'sidenavmobile'); 
         }
          //  $('#filterDiv').toggle("slide", { direction: "right" }, 1000);
    $A.util.toggleClass(cmpTarget1,'slds-hide');
     
        
    },
    button : function(component, event, helper) {
       var cmpTarget1 = component.find('filterDiv');
       $A.util.addClass(cmpTarget1,'slds-hide'); 	
       
    }
})