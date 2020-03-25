({
    doInit : function(component, event, helper) {
        
        var obj = component.get("v.objectname");
        var action = component.get("c.fetchvalues");
        action.setParams({"objname":obj});
        action.setCallback(this, function(response){
            console.log(JSON.stringify(response.getReturnValue())+"@@@@returnvalue");
            
           /* var objmap_temp = new Map();
            var mapkey =[];
            var objlist = response.getReturnValue();
            for(var obj in objlist ){
                console.log(objlist[obj].RecordType.Name);
                console.log("@@@@@ map contains key or not: "+objmap_temp.has(objlist[obj].RecordType.Name));
                if(!objmap_temp.has(objlist[obj].RecordType.Name)){
                    objmap_temp.set(objlist[obj].RecordType.Name,[]);   
                }
                
                objmap_temp.get(objlist[obj].RecordType.Name).push(objlist[obj]);
                console.log('objmap_temp >>>: '+objmap_temp);
            }
            
            component.set("v.objectmap",objmap_temp);
            var mymap = component.get("v.objectmap");
            console.log(JSON.stringify(mymap.keys())+"@@@@@@ maymap instance");
             mapkey.push(mymap.keys());
            var recordtype = [];
            for(var key in mapkey){
                console.log("@@@>>key in map"+mapkey[key]);
                recordtype.push(mapkey[key]);
                
            }
            component.set("v.recordtypelist",recordtype);
            console.log("@@@@>>> map key"+  component.get("v.recordtypelist"));*/
              var objmap = response.getReturnValue();
            var recordlist=[];
            for(var key in objmap){
                console.log(JSON.stringify(objmap[key])+key);
                recordlist.push({keyset:key, value:objmap[key]});
                               
            }
            console.log("@@>>"+JSON.stringify(recordlist));
            component.set("v.objectlist",recordlist);
        });
        $A.enqueueAction(action);
        
    },
    sendemail :  function(component, event, helper) {
        var obj = component.get("v.objectlist");
         console.log(obj+'emaillist');
           var recordlist=[];
        for(var key in obj){
            recordlist.push(obj[key].email);
        }  console.log("@@>>"+JSON.stringify(recordlist));
        /*var action = component.get("c.sendemailapex");
         var recordlist=[];
        console.log(obj+'emaillist');
        for(var key in obj){
            //recordlist.push(obj)
        }
        
        action.setParams({"emaillist":recordlist});
        action.setCallback(this, function(response){
            
           
        });
        $A.enqueueAction(action);*/
        
             
    }
})