function addRole() {
	    var sel = document.getElementById("select1");   
        var sel2 = document.getElementById("select2");
        for(var i=0;i<sel.length;i++){   
            if(sel.options[i].selected == true){
						var op = document.createElement("option");   
		                sel2.options.add(op);   
		                op.value = sel.options[i].value;    
		                op.innerText = sel.options[i].innerText; 
            }   
        }  
	}
	function addAllRole() {
	    var sel = document.getElementById("select1");   
        var sel2 = document.getElementById("select2");   
        for(var i=0;i<sel.length;i++){   
            var op = document.createElement("option");   
            sel2.options.add(op);   
            op.value = sel.options[i].value;    
            op.innerText = sel.options[i].innerText;   
        }  
	}
	function removeRole(){   
		var sel = document.getElementById("select1");   
        var sel2 = document.getElementById("select2");
        for(var i=0;i<sel2.length;i++){   
            if(sel2.options[i].selected == true){   
                var op = document.createElement("option");   
                sel.options.add(op);   
                op.value = sel2.options[i].value;    
                op.innerText = sel2.options[i].innerText;   
                sel2.removeChild(sel2.options[i]);   
            }   
        }  
    } 
	function removeAllRole(){   
		var sel = document.getElementById("select1");   
        var sel2 = document.getElementById("select2");   
        for(var i=0;i<sel2.length;i++){   
            var op = document.createElement("option");   
            sel.options.add(op);   
            op.value = sel2.options[i].value;    
            op.innerText = sel2.options[i].innerText;   
            sel2.removeChild(sel2.options[i]);   
        }  
    } 