function addRole() {
		var sel = document.getElementById("select1");
		var sel2 = document.getElementById("select2");   
		var s=0;     
		for(var i=0;i<sel.length;i++){             
			if   (sel[i].selected){
				s+=1;
			}     
		}     
		if (s==0){ 
		 	alert("下拉框中没有选中的项目"); 
		 	return;    
		}	   
        for(var i=0;i<sel.length;i++){   
            if(sel.options[i].selected == true){
            	for(var j=0;j<sel2.length;j++) {
					if(sel.options[i].value == sel2.options[j].value) {
						alert("该角色已存在");
						return;
					} 
            	}
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
        var s=0;     
		for(var i=0;i<sel2.length;i++){             
			if   (sel2[i].selected){
				s+=1;
			}     
		}     
		if (s==0){ 
		 	alert("下拉框中没有选中的项目"); 
		 	return;    
		}	  
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
	function getAllRoles(){
		if(check()) {
			var sel2 = document.getElementById("select2");
			for(var i=0;i<sel2.length;i++){
				sel2.options[i].selected = true;
			}
			return true;
		} else
		return false;
	}
	
	String.prototype.Trim=function() {
	    return this.replace(/(^\s*)|(\s*$)/g,"");
	}
	
	function check() {
		if(document.getElementById("user.userName").value.Trim() == "") {
			alert("请输入用户名");
		    document.getElementById("user.userName").focus(); 
			return false;
		}
		if(document.getElementById("user.userPassword").value.Trim() == "") {
			alert("请输入密码");
			document.getElementById("user.userPassword").focus(); 
			return false;
		}
		if(document.getElementById("userPassword2").value.Trim() == "") {
			alert("请再次输入密码");
			document.getElementById("userPassword2").focus(); 
			return false;
		}
		if(document.getElementById("user.userPassword").value.Trim() != document.getElementById("userPassword2").value.Trim()) {
			alert("两次密码不正确，请重新输入");
			document.getElementById("user.userPassword").focus(); 
			return false;
		}
		return true;
	}