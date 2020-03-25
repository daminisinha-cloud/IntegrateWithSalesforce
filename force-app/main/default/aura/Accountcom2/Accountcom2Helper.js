({
    getrecord : function(component, event, obj) {
        component.set('v.mycolumns', [
            
            { label: 'First Name', fieldName : 'FirstName', type: 'text'},
            { label: 'Last Name', fieldName : 'LastName', type: 'text'},
            { label: 'Phone', fieldName : 'Phone', type: 'phone' },
            { label: 'Email', fieldName : 'Email', type: 'Email'},
            {type: "button", label: 'Edit',typeAttributes: {
                
                label: 'Edit',
                name: 'selectRecord',
                title: 'selectRecord',
                disabled: false,
                value: 'test',
            }},
            {type: "button",   label: 'Delete',typeAttributes: {
                
                label: 'Delete',
                name: 'deleteRecord',
                title: 'deleteRecord',
                disabled: false,
                value: 'test1',
            }},
        ]);
            var action = component.get("c.fetchrecord");
            action.setParams({
            'objname': obj
            }); 
            action.setCallback(this, function(response) {
            var state = response.getState();
            var recordlist = [];
                      if (state === "SUCCESS") {
            var storeResponse = response.getReturnValue();
            if(storeResponse.length>10){
                
                component.set("v.Nextdisable",false);  
            }
            if(storeResponse.length===0){
                alert("No contacts found")
                
            }else{
                
                for(var i=0; i< 10; i++)
                    
                {
                    if(response.getReturnValue()[i])                       
                        recordlist.push(response.getReturnValue()[i]);
                    else{
                        component.set("v.previousdisable",true);
                        component.set("v.Nextdisable",true);
                        break;
                    }
                    
                }
                component.set("v.recordlist",recordlist);  
                component.set("v.completerecordlist",storeResponse);
                
                
            }
        }
    }); 
    
    $A.enqueueAction(action);
    
}, 
 
 deleteRow: function(component,event,helper, row) {
    var action = component.get("c.deleteContact");
    action.setParams({
        "contact":row
    });
    action.setCallback(this, function(response) {
        var state = response.getState();
        if (state === "SUCCESS") {	
            var rows = component.get('v.recordlist');
            var length = rows.length;
            var list = component.get("v.completerecordlist");
            var pag=  component.get("v.pagenumber");
            var rowIndex = rows.indexOf(row);
            var listIndex = list.indexOf(row);
            rows.splice(rowIndex, 1);
            list.splice(listIndex,1);
            component.set('v.completerecordlist', list);
            if(length===1){
                if(component.get("v.pagenumber")<=10)
                    alert("NO MORE RECORDS");
                else{
                    alert(component.get("v.pagenumber")+'pagenumber in delete');
                    component.set("v.Nextdisable",true);
                    helper.Previous(component,event,helper);
                }
                
            }
            else if(length===10){
                
                var ref = component.get("v.pagenumber")+1;
                if(list[ref]){
                    rows.push(list[ref]); 
                    component.set('v.recordlist', rows);
                }else{
                    component.set('v.recordlist', rows);
                    component.set('v.completerecordlist', list); 
                }
                
                if(list[ref+1])
                    component.set("v.Nextdisable",true);
                
            }
                else{
                    component.set('v.recordlist', rows);
                    component.set('v.completerecordlist', list); 
                }
            
            
            
        }
        
    });
    $A.enqueueAction(action);
},
    
    CSV2JSON: function (component,csv) {
        var arr = []; 
        
        arr =  csv.split('\n');
        arr.pop();
        var jsonObj = [];
        var headers = arr[0].split(',');
        for(var i = 1; i < arr.length; i++) {
            var data = arr[i].split(',');
            var obj = {};
            for(var j = 0; j < data.length; j++) {
                obj[headers[j].trim()] = data[j].trim();
            }
            jsonObj.push(obj);
        }
        var json = JSON.stringify(jsonObj);
        return json;
        
        
    },
        
        Createcontact : function (component,jsonstr,helper){
            var action = component.get("c.insertData");    
            action.setParams({
                "strfromlex" : jsonstr,
                "accountid"  :  component.get("v.recordId") 
            });
            action.setCallback(this, function(response) {
                var rows =  component.get('v.recordlist');
                var temp=[];
                var temp1=[];
                var list =  component.get('v.completerecordlist');
                if(list){
                    var ref = false;
                }
                else 
                    ref = true;
                alert(ref)
                
                var state = response.getState();
                alert(state);
                if (state === "SUCCESS") {  
                    alert("Contacts Inserted "); 
                    
                    console.log(component.get('v.completerecordlist'));
                    if(ref){
                        //data doesnot exits
                        if(response.getReturnValue().length>10){
                            
                            component.set("v.Nextdisable",false);  
                        }
                        for(var i=0; i< 10; i++)
                            
                        {
                            
                            if(response.getReturnValue()[i]){                     
                                temp.push(response.getReturnValue()[i]);
                            }
                            else{
                                component.set("v.previousdisable",true);
                                component.set("v.Nextdisable",true);
                                break;
                            }
                            
                        }
                        
                        component.set('v.recordlist',temp);
                        component.set('v.completerecordlist',response.getReturnValue());
                    }
                    else{
                        for(var k =0; k< response.getReturnValue().length; k++){ 
                            
                            list.push(response.getReturnValue()[k]);
                        }
                        component.set('v.completerecordlist',list); 
                        console.log(JSON.stringify(list)+'@@@@@@');
                        
                        if(rows.length<10){
                            var l = 10 -rows.length;
                            
                            for(var i=0; i<l; i++){
                                if(response.getReturnValue()[i])                       
                                    rows.push(response.getReturnValue()[i]);
                                else
                                    break;
                            }
                            component.set("v.recordlist",rows); 
                            if(l<response.getReturnValue().length){
                                
                                var pag =  component.get("v.pagenumber");
                                component.set("v.pagenumber",pag+l);
                                component.set("v.Nextdisable",false);
                                
                                
                                
                            }
                            
                        }
                        if(rows.length===10){
                            
                            component.set("v.Nextdisable",false);
                        }
                        
                        
                        
                    }
                    
                    
                }  
                
                
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                        errors[0].message);
                        }
                    } else {
                        
                    }
                }
                
            }); 
            
            $A.enqueueAction(action); 
            
            
        },
            Previous : function (component,event,helper){
                
                var pagenumber = component.get("v.pagenumber");
                component.set("v.recordlist",null);
                var recordlist =[];
                var i;
                var j=pagenumber-20;
                var r = j/10;
                var k = Math.ceil(r)*10;
                var list= component.get("v.completerecordlist");
                if(j<0){
                    component.set("v.previousdisable",true);
                }
                
                for( i=k; i< k+10 ; i++)
                {
                    recordlist.push(list[i]);
                    if(list[i+1]==undefined){
                        break;
                    }
                } 
                if(list[k+10]){
                    component.set("v.Nextdisable",false);
                    
                }
                component.set("v.pagenumber", k+10);
                component.set("v.recordlist",recordlist); 
                if(i+1===0){
                    component.set("v.previousdisable",true);
                    
                }
                
                
                
            },
                nextfun : function (component,event,helper){
                    var pagenumber = component.get("v.pagenumber");
                    if(pagenumber===0){
                        pagenumber+=10;
                    }
                    console.log(pagenumber+'next m pagenumber');
                    component.set("v.recordlist",null);
                    var recordlist =[];
                    
                    var i;
                    pagenumber = Math.floor(pagenumber/10)*10;
                    var k =pagenumber+10;
                    component.set("v.pagenumber",k);
                    var list= component.get("v.completerecordlist");
                    for( i=pagenumber; i< k ; i++)
                    {
                        if(list[i])
                            recordlist.push(list[i]);
                        else
                            break;
                    } 
                    component.set("v.pagenumber",i);
                    component.set("v.recordlist",recordlist); 
                    component.set("v.previousdisable",false);
                    
                    
                    if(i===list.length){
                        component.set("v.Nextdisable",true);
                    }
                    
                }

})