({
    display : function(component, event, helper) {
        var params = event.getParam('arguments');
        component.set("v.completerewardlists",params.completerewardlist);
        component.set("v.fields",params.field);
        component.set("v.tab",params.tabs);
        console.log(component.get("v.tab"));
        console.log(component.get("v.fields"));
        component.set("v.pagenumber","0");
        var completelist = component.get("v.completerewardlists");
        helper.currentfunction(component,event,helper,completelist);
        if(completelist.length>10){
            component.set("v.Nextdisable",false);
        }
        
    },
    NextList :  function(component, event, helper) {
        helper.next(component, event, helper);
    },
    PreviousList :  function(component, event, helper) {
        helper.Previous(component, event, helper);  
    },
    
    Addreward : function(component,event,helper){
        component.set("v.newrewardbool",true); 
    },
    
    Approveall : function(component,event,helper){
        var list = component.get("v.displayrewardlist");
        
        for(var i=0;i<list.length;i++){
            
            list[i].Approved__c=true;
            list[i].Reject__c=false;
            
            
        }
        component.set("v.displayrewardlist",list);
    },
    rejectall : function(component,event,helper){
        var list = component.get("v.displayrewardlist");
        for(var i=0;i<list.length;i++){
            list[i].Reject__c=true;
            list[i].Approved__c=false;
        }
        component.set("v.displayrewardlist",list);
    },
    Save : function(component,event,helper){
        var updatelist =[];
        var completelist = component.get("v.completerewardlists");
        var list = component.get("v.displayrewardlist");
        var length =list.length;
        console.log(list.length+"@@@length");
        for(var i=0;i<list.length;i++){
            
            console.log(JSON.stringify(list[i].Approved__c));
            if(list[i].Approved__c==true||list[i].Reject__c==true){
                var index = completelist.indexOf(list[i]);
                completelist.splice(index,1);
                updatelist.push(list[i]);
                list.splice(i,1);
                i--;
                
            }
        }
        component.set("v.completerewardlists",completelist);
        component.set("v.displayrewardlist",list);
        helper.updaterecord(component,event,helper,updatelist);
        var page = Number(component.get("v.pagenumber"));
        if(list==null){
            if(page!=0){
                component.set("v.pagenumber",page-1) 
            }
            else{
                alert("No more records");
            }
        }else{
            component.set("v.pagenumber",page-1)   
        }
        
        
        helper.currentfunction(component,event,helper,completelist);
         var compEvent = component.getEvent("oSelectedRecordEvent");
         compEvent.setParams({"recordByEvent" : "",
                              "completelist"  :  component.get("v.completerewardlists"),
                              "deletelist"    :   updatelist
                             });  
         compEvent.fire();
        
    },
    sortfunction : function(component,event,helper){
        var currentDir = component.get("v.arrowDirection");
        var index = event.target.dataset.index;
        var sortbyarray = component.get("v.fields");
        var sortby =sortbyarray[index];
        console.log(sortby);
        
        if (currentDir == 'arrowdown') {
            console.log("asc");
            component.set("v.arrowDirection", 'arrowup');
            component.set("v.isAsc", true);
        } else {
            console.log("des");
            component.set("v.arrowDirection", 'arrowdown');
            component.set("v.isAsc", false);
        }
        helper.sortdata(component,event,helper,component.get("v.isAsc"),sortby);
    },
    cancel : function(component,event,helper){
        component.set("v.newrewardbool",false);
    },
    
    clickCreate : function(component,event,helper){
        var acc = component.get("v.selectedLookUpRecord");
        var reward=component.get("v.newReward");
         var page = Number(component.get("v.pagenumber"));
        var Id =component.find('select').get('v.value');
        if(Id ='1')
            var Ids ='0126F000001MkyBQAS';
        if(Id ='2')
            var Ids ='0126F000001MkyGQAS';
        if(Id ='3')
            var Ids ='0126F000001MkyQQAS';
        
        Object.assign(reward, {Account__c: acc.Id,
                               RecordTypeId :Ids
                              });  
        var action = component.get("c.createrecord");
        console.log(JSON.stringify(reward));
        action.setParams({
            'reward': reward
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.newrewardbool",false);
          
            }
            else{
                alert("Server error");
            }
            
        });
        $A.enqueueAction(action);
        var list = component.get("v.displayrewardlist");
        if(list.length<10){
                console.log(page+"page@@@@@");
                component.set("v.pagenumber",page-1) 
                
            }
             if(component.get("v.selectedLookUpRecord").Id==acc.Id){
            var completelist = component.get("v.completerewardlists");
            list.push(reward);
            completelist.push(reward);
            component.set("v.completerewardlists",completelist);
            component.set("v.displayrewardlist",list);
            
            
            helper.currentfunction(component,event,helper,completelist);
            
        } 
         var compEvent = component.getEvent("oSelectedRecordEvent");
         compEvent.setParams({"recordByEvent" : "",
                              "completelist"  :  component.get("v.completerewardlists"),
                             
                            
                             });  
         compEvent.fire();
        
      
        
    },
    handleComponentEvent : function(component,event,helper){
       
      event.stopPropagation();

    }
    
})