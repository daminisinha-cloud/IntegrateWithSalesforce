({
    allowDrop: function(cmp, event, helper){
        event.preventDefault();
    },
    drag: function(cmp, ev, helper){
          var parentId = document.getElementById(ev.target.id).parentElement.id;
        console.log('parentId >>'+parentId);
        
        console.log('ev.target.id >>'+ev.target.id);
        cmp.set("v.startId",ev.target.id);//image id
        cmp.set("v.parentId",parentId);//div id
    },
    drop: function(cmp, ev, helper){
        var drag = cmp.get("v.startId");
         console.log('startId >>'+drag);
        var div = ev.target.id;//div id where the imag is draged to
         console.log('ev.target.id >>'+ev.target.id);
        var fragment = document.createDocumentFragment();
        fragment.appendChild(document.getElementById(drag));
        document.getElementById(div).appendChild(fragment);
       var c = document.getElementById(div).children;
         console.log('c >>'+c);
        var x = document.getElementById(drag).parentElement.id;//current div of the image
          console.log('x >>'+x);
        var fragment = document.createDocumentFragment();
        fragment.appendChild(document.getElementById(c[0].id));
        document.getElementById(cmp.get("v.parentId")).appendChild(fragment);
    }
})