({
	doInit : function(component, event, helper) {
         event.stopPropagation();
		alert("child called");
	}
})