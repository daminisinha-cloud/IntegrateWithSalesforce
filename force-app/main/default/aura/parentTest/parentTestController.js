({
	parentMethod : function(component, event, helper) {
		alert("Hello Prent");
	},
    parentMethod2 : function(component, event, helper) {
		alert("Hello Prent2");
	},
    click : function(component, event, helper){
        component.find("child").onclick2();
        //component.find("child").parentMethodInChild();
    }
})