function formValidation()
{
	var uid = document.registration.Username;          //Vengono presi i parametri dalla form
	var psw= document.registration.Password;	
	var uname = document.registration.Nome;
	var usurname = document.registration.Cognome;
	var cf=document.registration.CodiceFiscale;
	var uemail = document.registration.Email;
	var tel=document.registration.Telefono;
	var city=document.registration.Citta;
	var ind=document.registration.Indirizzo;
	var conf=document.registration.Confermapassword;
	
	if(checkid(uid)){
		if(checkname(uname)){
			if(checksurname(usurname)){
				if(checkcf(cf)){
					if(checkmail(uemail)){
						if(checktel(tel)){
							if(checkcity(city)){
								if(checkind(ind)){
								if(checkpw(psw)){
									if(confermapassword(psw,conf)){
									}
									else{
										return false;
									}
								}
								else{
									return false;
								}
							}
							else{
								return false;
							}
						}
						else{
								return false;
							}
						}
						else{
							return false;
						}
					}
					else{
						return false;
					}
				}
				else{
					return false;
				}
			}
			else{
				return false;
			}
		}
		else{
			return false;
		}
	}
	else{
		return false;
	}
	
}
	
function checkid(uid){
	if(uid.value.length==0 || uid.value.length<4){
		alert("Inserire username / inserire username con almeno 4 caratteri");
		uid.focus();
		return false;
	}
	return true;
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

function checkname(uname){
	var letters = /^[A-Za-z]+$/;
	if(uname.value==""){
		alert("Il campo nome non può essere vuoto");
		uname.focus();
		return false;
	}
	if(uname.value.match(letters)){
		return true;
	}
	else{
		alert("Il nome deve avere solo caratteri alfabetici");
		uname.focus();
		return false;
	}
}

function checkcf(cf){
	var pattern = /^[a-zA-Z]{6}[0-9]{2}[a-zA-Z][0-9]{2}[a-zA-Z][0-9]{3}[a-zA-Z]$/;
	if(cf.value==""){
		alert("Campo codice fiscale vuoto");
		cf.focus();
		return false;
	}
	return true;
}

function checksurname(usurname){
	var letters = /^[A-Za-z]+$/;
	if(usurname.value==""){
		alert("il campo cognome non può essere vuoto");
		usurname.focus();
		return false;
	}
	if(usurname.value.match(letters)){
		return true;
	}
	else{
		alert("Il cognome deve avere solo caratteri alfabetici");
		usurname.focus();
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

function checktel(tel){
	var numbers = /^[0-9]+$/;
	if(tel.value.match(numbers)){
		return true;
	}
	else{
		alert('Il campo telefono deve avere solo caratteri numerici / Il campo telefono non può essere vuoto');
		tel.focus();
		return false;
	}
}

function checkcity(city){
	var letters = /^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$/;
	if(city.value==""){
		alert("il campo città non può essere vuoto");
		city.focus();
		return false;
	}
	if(city.value.match(letters)){
		return true;
	}
	else{
		alert("La città deve avere solo caratteri alfabetici");
		city.focus();
		return false;
	}
}

function checkind(ind){
	var letters = /^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$/;
	if(ind.value==""){
		alert("il campo indirizzo non può essere vuoto");
		ind.focus();
		return false;
	}
	if(ind.value.match(letters)){
		return true;
	}
	else{
		alert("L'indirizzo deve avere solo caratteri alfabetici");
		ind.focus();
		return false;
	}
}

function confermapassword(psw,conf){
	var r = conf.value;
	var p = psw.value;
	var n = r.localeCompare(p);
	if(n != 0){
		alert("La password non coincide");
		psw.focus();
		return false;
	}
	else{
		return true;
	}
}

	