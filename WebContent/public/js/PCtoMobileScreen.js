function getCookie(name) {
		var cookies = document.cookie.split(";");
		for (var i = 0; i < cookies.length; i++) {
			if (cookies[i].indexOf("=") == -1) {
				if (name == cookies[i])
					return "";
			} else {
				var crumb = cookies[i].split("=");
				if (name == crumb[0].trim())
					return unescape(crumb[1].trim());
			}
		}
	};
	var desktopModeTF = getCookie("DesktopMode");
	var Scale = getCookie("DesktopModeScale");
	var defWidth = 1800;
	if (desktopModeTF == "true") {
		document.write('<meta name="viewport" content="width='+defWidth+', user-scalable=yes, initial-scale='+Scale+'">');
		
	} else {
		document
				.write('<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">');
	}
	function desktopMode() {
		if(getCookie("DesktopMode") == "true"){
			setModeCookie(false);
		}else{
			setModeCookie(true);
			window.scrollTo(0, 0);
		}
		
		location.href= window.location.pathname;
	}
	function setModeCookie(switchOn){
		var now = new Date();
		var time = now.getTime();
		time += 3600 * 1000;
		now.setTime(time);
		document.cookie ='DesktopMode='+switchOn +'; expires=' + now.toUTCString() ;
		if(switchOn){
			document.cookie = "DesktopModeScale=" + $('html').width() / defWidth +'; expires=' + now.toUTCString() ;;
		}
	}

	