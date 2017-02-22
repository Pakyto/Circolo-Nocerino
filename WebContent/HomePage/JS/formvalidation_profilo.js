function formValidation_profilo()
{
	var uemail = document.profilo.Email;
	var psw= document.profilo.Password;	
	
	if(checkmail(uemail)){
		if(checkpw(psw)){
		}
		else{
			return false;
		}
	}
	else{
		return false;
	}
}

function checkmail(uemail){
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(uemail.value.match(mailformat)){
		return true;
	}
	else{
		alert("Hai inserito un'indirizzo email errato! /Il campo mail non può essere vuoto");
		uemail.focus();
		return false;
	}
}

function checkpw(psw){
	var passid_len = psw.value.length;
	if (passid_len == 0 ||passid_len >= 12 || passid_len < 7){
		alert("Il campo password non può essere vuoto / la lunghezza deve essere tra 7 e 12");
		psw.focus();
		return false;
	}
	return true;
}
