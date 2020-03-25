({
    helperMethodcom3 : function(component,textvalue,parentobj) {
        
        var action= component.get("c.getlist");
        console.log(parentobj);
        action.setParams({"text": textvalue,"parentobj":parentobj});
        action.setCallback(this,function(response){
            if(response.getState()==='SUCCESS'){
                alert('sucess com3')              
               component.set("v.record",response.getReturnValue());
                }
            else{
           alert('component3error');}
        } );
        $A.enqueueAction(action);
    }
})