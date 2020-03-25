({
	//MAX_FILE_SIZE: 750000,

    save : function(component) {
        var fileInput = component.find("file").getElement();
    	var file = fileInput.files[0];
        var MAX_FILE_SIZE = 750000;
        if (file.size > MAX_FILE_SIZE) {
            alert('File size cannot exceed ' + MAX_FILE_SIZE + ' bytes.\n' +
    	          'Selected file size: ' + file.size);
    	    return;
        }
    
        var fr = new FileReader();
        
       
       	fr.onload = function() {
            var fileContents = fr.result;
    	    var base64Mark = 'base64,';
            var dataStart = fileContents.indexOf(base64Mark) + base64Mark.length;

            fileContents = fileContents.substring(dataStart);
            var fn = component.get('c.upload');
               $A.enqueueAction(fn);             
    	    //	this.upload(component, file, fileContents);
        };

        fr.readAsDataURL(file);
    },
        
    upload: function(component, file, fileContents) {
        var action = component.get("c.saveTheFile"); 

        action.setParams({
            parentId: component.get("v.parentId"),
            fileName: file.name,
            base64Data: encodeURIComponent(fileContents), 
            contentType: file.type
        });

        action.setCallback(this, function(a) {
            attachId = a.getReturnValue();
            console.log(attachId);
        });
            

            $A.enqueueAction(action); 
      
    }
})