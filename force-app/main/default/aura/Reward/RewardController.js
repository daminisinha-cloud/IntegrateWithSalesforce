({
    handleComponentEvent : function(component, event, helper) {
         var ref = event.getParam("recordByEvent");
          var deletelist = event.getParam("deletelist");
        console.log(JSON.stringify(ref))
         console.log(JSON.stringify(deletelist))
        if(ref==""){
              var paymentlist=[];
                var renewlist=[];
                var surveylist=[];
            var list = event.getParam("completelist");
           var completelist= component.get("v.completerewardlist");
                          

            if(deletelist){
             for(var i =0;i<deletelist.length;i++){
                for(var j =0;j<completelist.length;j++){
                    if(deletelist[i].Id==completelist[j].Id){
                        completelist.splice(j,1);
                        break;
                    }
                }
            }   
            }
            if(list){
              for(var i=0; i<list.length;i++){
                completelist.push(list[i]);
            }  
            }
                   for(var i=0;i<list.length;i++){
                if( list[i].RecordType.Name=="Payments"){
                    paymentlist.push(list[i]);
                    component.set("v.paymentlist",paymentlist);
                    
                }  
                else if( list[i].RecordType.Name=="Renew"){
                    renewlist.push(list[i]);
                    component.set("v.Renewlist",renewlist);
                    
                }  
                    else{
                        surveylist.push(list[i]);
                        component.set("v.surveylist",surveylist);
                        
                    } 
                
            }
           component.set("v.completerewardlist",completelist); 
        }
        else{
          var ref = component.get("v.selectedLookUpRecord");
        helper.fetchrecords(component,event,helper,ref);    
        }
       
        
    },
    handleChange : function(component, event, helper){
        var selectedtab =component.find("tabs").get("v.selectedTabId");
        component.set("v.tab",selectedtab);
      
        if(selectedtab=='Pay'){
            var ref = component.find("Payment");
            ref.displayrecords(component.get("v.paymentlist"),['Name','Address','Move In Date','Start Date','Total','Payment date','Approve','Reject'],'Payment');
            
        }
        if(selectedtab=='new'){
            var ref = component.find("Renew");
            ref.displayrecords(component.get("v.Renewlist"),['Name','Address','Move In Date','Start Date','Total','Approve','Reject'],'Renew');
            
        }
        if(selectedtab=='Sur'){
            var ref = component.find("Survey");
            ref.displayrecords(component.get("v.surveylist"),['Name','Address','Move In Date','Start Date','Total','Survey completed','Complete Date','Approve','Reject'],'Survey');
            
        }
         if(selectedtab=='all'){
            var ref = component.find("all");
            ref.displayrecords(component.get("v.completerewardlist"),['Name','Address','Move In Date','Start Date','Total','Record Type','Approve','Reject'],'all');
            
        }
   
    }
    
})