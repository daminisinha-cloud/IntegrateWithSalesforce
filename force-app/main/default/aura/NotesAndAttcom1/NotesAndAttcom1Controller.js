({
    handleChange : function(component, event, helper) {
        var NoteEvent = $A.get("e.c:NotesAndAttEvent1");
        var val = component.get("v.value");
        var objName=component.get("v.objName");
        var record=component.get("v.record");
        alert("note1"+val);
        NoteEvent.setParams({"notesOrAtt" : val ,"objName":objName,"record":record});
        NoteEvent.fire();
    },
    fireEventcom1:function(component,event,helper){
         var NoteEvent = $A.get("e.c:NotesAndAttEvent1");
        var objName= event.getParam("objName");
         var record= event.getParam("record");
        component.set("v.objName",objName);
        component.set("v.record",record);
    }
})