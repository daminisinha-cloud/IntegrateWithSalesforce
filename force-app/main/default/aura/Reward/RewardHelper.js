({
    fetchrecords : function(component,event,helper,acc) {
        var action = component.get("c.fetchreward");
        action.setParams({
            'acc': acc,
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                var paymentlist=[];
                var renewlist=[];
                var surveylist=[];
                if(storeResponse.length!==0){
                    component.set("v.completerewardlist", storeResponse); 
                    
                for(var i=0;i<storeResponse.length;i++){
                        if( storeResponse[i].RecordType.Name=="Payments"){
                            paymentlist.push(storeResponse[i]);
                            component.set("v.paymentlist",paymentlist);
                            
                        }  
                        else if( storeResponse[i].RecordType.Name=="Renew"){
                            renewlist.push(storeResponse[i]);
                            component.set("v.Renewlist",renewlist);
                            
                        }  
                            else{
                                surveylist.push(storeResponse[i]);
                                component.set("v.surveylist",surveylist);
                                
                            } 
                        
                    }
              
                    var all =component.find("tabs").get("v.selectedTabId");
                    console.log(all)
                    var ref = component.find(all);
                    console.log(ref+"@@@");
                    ref.displayrecords(component.get("v.completerewardlist"),['Name','Address','Move In Date','Start Date','Total','Record Type','Approve','Reject'],'all');
                    
                    
                }
                
                else{
                    alert("No records found");
                }
                
            }
            else{
                alert("Server error");
            }
            
        }); 
        $A.enqueueAction(action);
        
        
    },
   
})