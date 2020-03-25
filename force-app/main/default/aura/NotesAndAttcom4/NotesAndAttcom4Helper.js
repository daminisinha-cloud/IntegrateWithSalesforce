({
    helperMethodcom4 : function(component,noteOrAtt,recordfetch){
        var action= component.get("c.finalrecords");
        action.setParams({
            'radiovalue': noteOrAtt,
            'record': recordfetch
        });
        action.setCallback(this,function(response){
            if(response.getState()==='SUCCESS'){
                alert('sucees com4');
                console.log(response.getReturnValue());
                component.set("v.recordview",response.getReturnValue());   
                 }
            else{
                alert('com4 error');
              }
        } );
        $A.enqueueAction(action);
    } ,
    helpermethodSearchcom4:function(component,noteOrAtt,recordfetch,parent){
        var action= component.get("c.recordsearch");
        action.setParams({'name':  recordfetch  ,'parent':parent,'radiovalue': noteOrAtt });
        action.setCallback(this,function(response){
            if(response.getState()==='SUCCESS'){
                alert('com4 success');
                component.set("v.recordview",response.getReturnValue());
            console.log(response.getReturnValue());}
            else
                console.log('error');
        }); $A.enqueueAction(action);
                           }
    })