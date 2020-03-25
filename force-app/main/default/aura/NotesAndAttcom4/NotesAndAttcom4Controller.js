({
    firevent4 : function(component, event, helper) {
        var noteOrAtt = event.getParam("notesOrAtt");
        var recordfetch = event.getParam("record");
        var parent=event.getParam("objName");
        component.set("v.radioValue",noteOrAtt);
        var bool=component.get("v.radioValue");
        if(bool==='Attachment'){
            component.set("v.booleanValue",'false');
            
        }else{
           component.set("v.booleanValue",'true'); 
        }
        var isEmpty = $A.util.isEmpty(event.getSource().get('v.val'));
        console.log(isEmpty);
        if(!isEmpty){
            helper.helpermethodSearchcom4(component,noteOrAtt,recordfetch,parent); 
        }
        helper.helperMethodcom4(component,noteOrAtt,recordfetch);
       
       
    }
    
    })