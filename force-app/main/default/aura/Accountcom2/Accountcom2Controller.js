({
    handleEvent : function(component, event, helper) {
        var rec = event.getParam("record");			
        if(rec){
            component.set("v.recordId",rec.Id);
            helper.getrecord(component, event, rec);
            component.set("v.createcontact",false);
            
        }
        else{
            component.set("v.recordlist",null);
            component.set("v.completerecordlist",null);
            component.set("v.Nextdisable",true);
            component.set("v.previousdisable",true);
            component.set("v.createcontact",true);
            
            
        }
        
    },
    cancelrecord : function(component, event, helper){
        component.set("v.bool",false)
        
    },
    buttonclicked : function (component, event,helper){
        
        var action = event.getParam('action');
        var row = event.getParam('row');
        switch (action.name) {
            case 'selectRecord':
                component.set("v.recordId",row.Id);
                component.set("v.bool",true); 
                
                var rows = component.get('v.recordlist');
                var rowIndex = rows.indexOf(row);
                component.set("v.index",rowIndex);
                component.set('v.recordlist', rows);
                break;
            case 'deleteRecord':
                
                helper.deleteRow(component,event,helper, row);
                break;
                
        }
        
    },
    
    EditContactsubmit : function(component,event,helper){
        var eventFields = event.getParam("fields");
        component.set("v.object",eventFields);
        
    },
    
    EditContactsuccess : function(component,event,helper){
        component.set("v.bool",false);
        
        var param = event.getParams().id;
        var obj = component.get("v.object");       
        Object.assign(obj, {Id: param}); 
        var rows = component.get('v.recordlist');
        var rowIndex =  component.get("v.index");
        rows.splice(rowIndex, 1);
        rows.push(obj);
        component.set("v.recordlist",rows);
        
        
    },
    CreateContact : function(component,event,helper){ 
        component.set("v.boolToNew",true);
        
    },
    cancelCreate : function(component,event,helper){ 
        component.set("v.boolToNew",false);
        
    },
    createsuccess  : function(component,event,helper){ 
        component.set("v.boolToNew",false);
        
        var param = event.getParams().id;
        var obj = component.get("v.object");        
        Object.assign(obj, {Id: param}); 
        var list = component.get('v.completerecordlist');
        var rows = component.get('v.recordlist');
        if(list){
           list.push(obj);
        component.set("v.completerecordlist",list);
        var length =  component.get('v.recordlist').length;
        if(length<10){
            rows.push(obj); 
            component.set("v.recordlist",rows);
        }else{
            component.set("v.Nextdisable",false);
            
        }  
        }
        else{
            var temp1=[];
            var temp2=[];
            temp1.push(obj);
        component.set("v.completerecordlist",temp1);
        
            temp2.push(obj); 
            component.set("v.recordlist",temp2);
    
            component.set("v.Nextdisable",false);
            
       
            
        }
       
    },
    submitcontact : function(component,event,helper){ 
        var eventFields = event.getParam("fields");
        var fields = event.getParam("fields");
        fields["AccountId"] = component.get("v.recordId");
        component.find("newcontact").submit(fields);
        component.set("v.object",eventFields);
        
    },
    NextList : function(component,event,helper){ 
      helper.nextfun(component,event,helper);
    },
    PreviousList : function(component,event,helper){
        helper.Previous(component,event,helper);
        
    },
    upload_csv : function(component,event,helper){
        var fileInput = component.find("file").getElement();
        console.log(JSON.stringify(fileInput));
        var file = fileInput.files[0];
        console.log(file);
        if (file) {
            console.log("File");
            var reader = new FileReader();
            reader.readAsText(file, "UTF-8");
            var result='';
            reader.onload = function (evt) {
                console.log("EVT FN");
                var csv = evt.target.result;
                result = helper.CSV2JSON(component,csv);
          
            }
             window.setTimeout($A.getCallback(function(){
            helper.Createcontact(component,result,helper);          
         }), 5);
                
            reader.onerror = function (evt) {
                console.log("error reading file");
            }
        } 
    }
})