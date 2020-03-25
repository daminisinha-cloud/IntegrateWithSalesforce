({
    currentfunction : function(component,event,helper,list){
        var displaylist=[];
        var length = Math.floor(list.length/10)-1;
        console.log(length +"&&&&&list length");
        var page =component.get("v.pagenumber");
        if(page==length)
            component.set("v.Nextdisable",true);
        
        
        var i= page*10;
        console.log(i)
        for(var j = i;j<i+10; j++ ){
            if(list[j])
                displaylist.push(list[j]);
            else
                break;
        }
        component.set("v.displayrewardlist",displaylist);
        component.set("v.pagenumber",page+1);
        
        
    },
    next : function(component,event,helper){
        var page = component.get("v.pagenumber");
        var displaylist =[];
        var list= component.get("v.completerewardlists");
        
        var i= page*10;
        for( var j=i; j<i+10 ; j++)
        {
            if(list[j])
                displaylist.push(list[j]);
            else
                break;
        } 
        if(list.length/10==0){
            var length = list.length;
        }else{
            var length=Math.floor(list.length/10)+1;      
        }
        
        
        component.set("v.pagenumber",Number(page)+1);
        component.set("v.displayrewardlist",displaylist); 
        component.set("v.previousdisable",false);
        if(page==length-1){
            component.set("v.Nextdisable",true);
        }
        
        
    },
    Previous : function (component,event,helper){
        component.set("v.Nextdisable",false);
        
        var page = component.get("v.pagenumber")-2;
        var displaylist =[];
        var i=page*10;
        var list= component.get("v.completerewardlists");
        
        
        for( var j=i; j< i+10 ; j++)
        {
            
            if(list[j])
                displaylist.push(list[j]);
            else
                break;
            
        } 
        if(page==0){
            component.set("v.previousdisable",true);
        }
        
        component.set("v.pagenumber", page+1);
        component.set("v.displayrewardlist",displaylist); 
        
        
        
        
    },
    updaterecord : function(component,event,helper,updatelist){
        var action = component.get("c.updaterecord");
        console.log(JSON.stringify(updatelist));
        action.setParams({
            'updatelist': updatelist,
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
                
            }
            else{
                alert("Server error");
            }
            
        });
        // enqueue the Action  
        $A.enqueueAction(action);
    },
    sortdata : function(component,event,helper,currentDir,sortby){
        var list=  component.get("v.displayrewardlist");
        console.log(list);
        if(sortby=='Record Type'){
            sortby ="RecordType";
            if( component.get("v.isAsc")==true){
                for(var i=0;i<list.length;i++){
                    for(var j=i+1;j<list.length;j++)
                    {
                        console.log(JSON.stringify(list[i][sortby]))
                        if(list[i][sortby].Name<list[j][sortby].Name){
                            var temp = list[i];
                            list[i]=list[j];
                            list[j]=temp;
                        }
                        
                    }
                }  
            }else{
                for(var i=0;i<list.length;i++){
                    for(var j=i+1;j<list.length;j++)
                    {
                        console.log(JSON.stringify(list[i][sortby]))
                        if(list[i][sortby].Name>list[j][sortby].Name){
                            var temp = list[i];
                            list[i]=list[j];
                            list[j]=temp;
                        } 
                    }
                }
                
            }
            component.set("v.displayrewardlist",list);
        }  
        
        else{
            if( component.get("v.isAsc")==true){
                for(var i=0;i<list.length;i++){
                    for(var j=i+1;j<list.length;j++)
                    {
                        console.log(JSON.stringify(list[i][sortby]))
                        if(list[i][sortby]<list[j][sortby]){
                            var temp = list[i];
                            list[i]=list[j];
                            list[j]=temp;
                        }
                        
                    }
                }  
            }else{
                for(var i=0;i<list.length;i++){
                    for(var j=i+1;j<list.length;j++)
                    {
                        console.log(JSON.stringify(list[i][sortby]))
                        if(list[i][sortby]>list[j][sortby]){
                            var temp = list[i];
                            list[i]=list[j];
                            list[j]=temp;
                        } 
                    }
                }
                
            }
            component.set("v.displayrewardlist",list);
        }
        
    }
})