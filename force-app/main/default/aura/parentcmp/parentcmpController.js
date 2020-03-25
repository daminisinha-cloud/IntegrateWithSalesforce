({
    onfocus : function(component,event,helper){
        $A.util.addClass(component.find("mySpinner"), "slds-show");
        var forOpen = component.find("searchRes");
        $A.util.addClass(forOpen, 'slds-is-open');
        $A.util.removeClass(forOpen, 'slds-is-close');  
        var getInputkeyWord = '';
        helper.searchHelper(component,event,getInputkeyWord);
    },
    onblur : function(component,event,helper){       
        component.set("v.record", null );
        var forclose = component.find("searchRes");
        $A.util.addClass(forclose, 'slds-is-close');
        $A.util.removeClass(forclose, 'slds-is-open');
    },
    keyPressController : function(component, event, helper) {  
        var getInputkeyWord = component.get("v.searchkey"); 
        if( getInputkeyWord.length > 0 ){
            var forOpen = component.find("searchRes");
            $A.util.addClass(forOpen, 'slds-is-open');
            $A.util.removeClass(forOpen, 'slds-is-close');
            helper.searchHelper(component,event,getInputkeyWord);
        }
        else{  
            component.set("v.record", null ); 
            var forclose = component.find("searchRes");
            $A.util.addClass(forclose, 'slds-is-close');
            $A.util.removeClass(forclose, 'slds-is-open');
        }
    },
    
    // function for clear the Record Selaction 
    clear :function(component,event,heplper){
        var pillTarget = component.find("lookup-pill");
        var lookUpTarget = component.find("lookupField"); 
        
        $A.util.addClass(pillTarget, 'slds-show');
        $A.util.removeClass(pillTarget, 'slds-hide');
        
        $A.util.addClass(lookUpTarget, 'slds-hide');
        $A.util.removeClass(lookUpTarget, 'slds-show');
        
        component.set("v.searchkey",null);
        component.set("v.record", null );
        
        var appEvent = $A.get("e.c:accountAppEvent");
        appEvent.setParams({ "record" : null ,"bool": false});
        appEvent.fire();
        
    }, 
    SearchContact : function(component, event, helper){
       
        var obj =  component.get("v.objname"); 
       	var appEvent = $A.get("e.c:accountAppEvent");
        appEvent.setParams({ "record" :  obj ,"bool": false});
        appEvent.fire();
    },
    handleComponentEvent : function(component, event, helper) {	
        var bool = event.getParam("bool");
        var obj = event.getParam("objname");
        component.set("v.objname" ,obj );
        component.set("v.objnameid" ,obj.Id );
        component.set("v.bool",bool);
                                                    
        var forclose = component.find("lookup-pill");
        $A.util.addClass(forclose, 'slds-show');
        $A.util.removeClass(forclose, 'slds-hide');
        
        var forclose = component.find("searchRes");
        $A.util.addClass(forclose, 'slds-is-close');
        $A.util.removeClass(forclose, 'slds-is-open');
        
        var lookUpTarget = component.find("lookupField");
        $A.util.addClass(lookUpTarget, 'slds-hide');
        $A.util.removeClass(lookUpTarget, 'slds-show');      
    },
    handleEvent : function(component, event, helper) {
       
    var rec = event.getParams();
     
      var obj = rec.record;
       if(obj)
       {
           console.log(obj);
     component.set("v.objname" ,rec.record );
      console.log( component.get("v.objname"));
      component.set("v.check", obj.Name);console.log(component.get("v.objname").Name);
           
      var forclose = component.find("lookup-pill");
      $A.util.addClass(forclose, 'slds-show');
      $A.util.removeClass(forclose, 'slds-hide');
           
        var lookUpTarget = component.find("lookupField");
        $A.util.addClass(lookUpTarget, 'slds-hide');
        $A.util.removeClass(lookUpTarget, 'slds-show'); 
                                                                
                                                                
      }
                                                       
   },
    
    cancelrecord : function(component, event, helper){
        component.set("v.bool",false);
    },
  
     handleClick : function(component, event, helper){
        var appEvent = $A.get("e.c:accountAppEvent");
        appEvent.setParams({ "record" :  "",
                            "bool":true });
        appEvent.fire();
        
    },
     cancel : function(component,event,helper){
    var com =component.set("v.bool",false); 
    },
        onsubmit : function(component,event,helper){
            var eventFields = event.getParam("fields");
          component.set("v.object",eventFields);
     
    },
   
        handleSuccess : function(component,event,helper){
         component.set("v.bool",false);
        var param = event.getParams().id;
        console.log('id in account edit' + param);
        var obj = component.get("v.object");       
        Object.assign(obj, {Id: param});  
            component.set("v.objname",obj);
               
      
    }
})