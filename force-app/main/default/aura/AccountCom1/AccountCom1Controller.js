({
	handleClick : function(component, event, helper) {alert('search')
     var obj =  component.get("v.objname");
     var obj1 =  component.get("v.objnameid");
                                          
	//helper.getrecord(component, event, obj);	
      var appEvent = $A.get("e.c:accountAppEvent");
       appEvent.setParams({ "record" :  obj , "recordid" : obj1});
        appEvent.fire();
	},
    handleEvent : function(component, event, helper){
       var obj = event.getParam("objname");
        console.log('grandparent')
      // Object.keys(obj).forEach(key => component.set("v.objname",obj[key]));
       // Object.keys(obj).forEach(key => console.log(obj[key]));
          component.set("v.objname",JSON.stringify(obj));console.log(JSON.stringify(obj.Id))
           component.set("v.objnameid",JSON.stringify(obj.Id));
       console.log(component.get("v.objname")+'accountcom1 -object name')
    }
})