({
	onclick1 : function(component, event, helper) {
 
    var p = component.get("v.parent");
    p.parentMethod();
         p.parentMethod2();

	},
    onclick2 : function(component, event, helper) {
 
    alert('Called!!!');
    },
    parentMethodInChild : function(component, event, helper) {
        alert('!!@@@@@@@@@@@@@@');
    }
})