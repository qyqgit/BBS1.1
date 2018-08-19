  function formatDate(id){
	if(!(document.getElementById(id).value == null || document.getElementById(id).value == "")){
		var regExp = /^\d{4}\/\d{2}\/\d{2}$/;
		var regExp2 = /^\d{4}\-\d{2}\-\d{2}$/;
		if(regExp.test(document.getElementById(id).value)||regExp2.test(document.getElementById(id).value)){
			var intYear = document.getElementById(id).value.substring(0,4)
			var intMonth = document.getElementById(id).value.substring(5,7)
			var intDay = document.getElementById(id).value.substring(8,10)
			if(isDate(intYear,intMonth,intDay))
				return;
			else{
			      alert("input date error.");
				  //document.getElementById(id).focus();
				  document.getElementById(id).value = "";
				  return;
			}
		}
			
		var reg = /^[0-9]+.?[0-9]*$/;
		if (!(reg.test(document.getElementById(id).value))) {
		  alert("birthday need to be eight number(yyyymmdd or yyyy/mm/dd).");
		  //document.getElementById(id).focus();
		  document.getElementById(id).value = "";
		  return;
		}
		if(document.getElementById(id).value.length!=8){
		  alert("birthday need to be eight number(yyyymmdd or yyyy/mm/dd).");
		  //document.getElementById(id).focus();
		  document.getElementById(id).value = "";
		  return;
		}
		var year = document.getElementById(id).value.substring(0,4)
		var month = document.getElementById(id).value.substring(4,6)
		var day = document.getElementById(id).value.substring(6,8)
		if(!isDate(year,month,day)) {
	      alert("input date error.");
		  //document.getElementById(id).focus();
		  document.getElementById(id).value = "";
		  return;
			
		}
		document.getElementById(id).value = year + "/" + month + "/" + day;
	}

  }
  function isDate(intYear,intMonth,intDay){
	if(isNaN(intYear)||isNaN(intMonth)||isNaN(intDay)) return false;   
	if(intMonth>12||intMonth<1) return false; 
	if ( intDay<1||intDay>31)return false; 
	if((intMonth==4||intMonth==6||intMonth==9||intMonth==11)&&(intDay>30)) return false; 
	if(intMonth==2){ 
	  if(intDay>29) return false;  
	  if((((intYear%100==0)&&(intYear%400!=0))||(intYear%4!=0))&&(intDay>28))return false; 
	}
	return true; 
   }