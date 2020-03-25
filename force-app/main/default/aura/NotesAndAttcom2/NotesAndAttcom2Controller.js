({
    doInIt: function(component,event,helper){
      var newvalue = component.get("v.selectedValue")
   helper.helperMethod(component,newvalue);
    },
    firevent:function(component,event,helper){
      
        var NoteEvent=event.getParam("notesOrAtt");
        component.set("v.selectedValue",NoteEvent);
        alert("radiovalue Fireevent in com2 "+ component.get("v.selectedValue"));
         helper.helperMethod(component,NoteEvent);
        },
    onselect:function(component,event,helper){
       var NoteEvent2 = $A.get("e.c:NotesAndAttEvent1");
        var val =component.find("objectId").get("v.value");
        var radio_value= component.get("v.selectedValue");
        console.log(radio_value);
        console.log(val);
      //  alert(val+ ' com2 parentobj');
    //    alert(radio_value +' com2 radiovalueOnselect');
        NoteEvent2.setParams({"notesOrAtt" : radio_value ,"objName" : val });
        NoteEvent2.fire();  
    }
})