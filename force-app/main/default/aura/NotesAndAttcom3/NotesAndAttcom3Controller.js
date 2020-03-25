({
    firevent3 : function(component, event, helper) {
        var objname=event.getParam("objName");
        var radio_value_event=event.getParam("notesOrAtt");
        console.log(radio_value_event);
        console.log(objname);
        component.set("v.objectName",objname); 
        component.set("v.Radio_value",radio_value_event);
        alert(radio_value_event+ ' com3 radio on fire event');
    },
    handleKeyUp :function(component,event,helper){
        var queryTerm = component.find('enter-search').get('v.value');
        var obj = component.get("v.objectName");
        
        helper.helperMethodcom3(component,queryTerm,obj);
        
        
    },
    selectrecord: function(component,event,helper){
        var index = event.target.dataset.index;
        var queryTerm = component.find('enter-search').set('v.value',component.get("v.record")[index].Name);
        var record_id = component.set("v.record_id",component.get("v.record")[index].Id);
         var NoteEvent3 = $A.get("e.c:NotesAndAttEvent1");
        var val = component.get("v.objectName");
        var radio_value=component.get("v.Radio_value");
        var record_id = component.get("v.record_id");
        NoteEvent3.setParams({"objName" : val ,"notesOrAtt": radio_value,"record":record_id});
        NoteEvent3.fire();
    },
    getcompletedata:function(component,event,helper){
       var queryTerm = component.find('enter-text').get('v.value');
        component.set("v.val",queryTerm);
        var recName = component.get("v.val");
         var NoteEvent3 = $A.get("e.c:NotesAndAttEvent1");
        var val = component.get("v.objectName");
        var radio_value=component.get("v.Radio_value");
       
        NoteEvent3.setParams({"objName" : val ,"notesOrAtt": radio_value,"record":recName});
        NoteEvent3.fire();
    }
})