  window.onload = function() {
    document.getElementById('morein').style.display = 'none';
  }
  
  function addEmoji() {
    if(document.getElementById('morein').style.display == 'none')
      document.getElementById('morein').style.display='block';
    else
      document.getElementById('morein').style.display='none';
  }
  function emojiFun(emoji) {
	  document.getElementById("text").focus();
      var log = document.execCommand("insertimage", false, emoji);
      if(!log) {
    	  var range = window.getSelection().getRangeAt(0);
    	  var img = document.createElement("img");
    	  img.setAttribute("src", emoji);
    	  range.insertNode(img);
      }
      addEmoji();
  }

  function Submit() {
      document.getElementById("textarea").value=document.getElementById("text").innerHTML;
	  if(inputCheck())
      	document.getElementById("form1").submit();
  }
  
  function insertAudio() {
  	  var url = prompt("audio url:");
	  if(url != null && url.length != 0) {
		  document.getElementById("text").focus();
	      var log = document.execCommand("inserthtml", false, "&nbsp;<audio src='" + url + "' controls='controls' loop='loop'></audio>&nbsp;");
	      if(!log) {
	    	  var range = window.getSelection().getRangeAt(0);
	    	  var audio = document.createElement("audio");
	    	  audio.setAttribute("src", url);
	    	  audio.setAttribute("controls", "controls");
	    	  audio.setAttribute("loop", "loop");
	    	  range.insertNode(audio);
	      }
	  }
  }
  function insertVideo() {
	  var url = prompt("video url:");
	  if(url != null && url.length != 0) {
		  document.getElementById("text").focus();
	      var log = document.execCommand("inserthtml", false, "&nbsp;<video src='" + url + "' controls='controls' style='max-width:1024px;max-height:576px'></video>&nbsp;");
	      if(!log) {
	    	  var range = window.getSelection().getRangeAt(0);
	    	  var video = document.createElement("video");
	    	  video.setAttribute("src", url);
	    	  video.setAttribute("controls", "controls");
	    	  video.setAttribute("style", "max-width:1024px;max-height:576px");
	    	  range.insertNode(video);
	      }
	  }
  }
  function insertImage() {
	  var url = prompt("image url:");
	  if(url != null && url.length != 0) {
		  document.getElementById("text").focus();
	      var log = document.execCommand("inserthtml", false, "<a href='" + url + "'><img src='"+ url +"' style='max-width:1024px;max-height:576px'></a>");
	      if(!log) {
	    	  var range = window.getSelection().getRangeAt(0);
	    	  var a = document.createElement("a");
	    	  a.setAttribute("href", url);
	    	  a.innerHTML = "<img src='"+ url +"' style='max-width:1024px;max-height:576px'>";
	    	  range.insertNode(a);
	      }
	  }
  }
  function clearDiv() {
	  document.getElementById("text").innerHTML = "";
  }
  function inputLength() {
	  var y=document.getElementById("text").innerHTML;
	  document.getElementById("len").innerHTML=y.length;
  }