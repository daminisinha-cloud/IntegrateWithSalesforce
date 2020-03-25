({
    helperMethod : function(component,newValue) {
        var action= component.get("c.getName");
        action.setParams({"value": newValue});
        action.setCallback(this,function(response){
            if(response.getState()==='SUCCESS'){
                alert("sucess com2");
                component.set("v.options",response.getReturnValue());}
            else{
                alert('component2error');}
        } );
        $A.enqueueAction(action);
        
    }
})