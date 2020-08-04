/**
 * 
 */

/*

------------ Funciones para manipulación del AJAX

*/
function AJAXInteraction(url, callback, divName, sndcallback)
{
	toggleBox('processDiv', 1);
	
	var req = init();
	req.onreadystatechange = processRequest;
	
	function init()
	{
		if (window.XMLHttpRequest)
		{
			return new XMLHttpRequest();
		}
		else if (window.ActiveXObject)
		{
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	
	function processRequest ()
	{
		if (req.readyState == 4)
		{
			if (req.status == 200)
			{
				toggleBox('processDiv', 0);
				//console.log('previo callback [' + callback + ']');
				if (callback) callback(req.responseText, divName, sndcallback);
			}
			else if (req.status == 404)
			{
				toggleBox('processDiv', 0);
				alert('404 Page not found [' + url + ']');
			}
			else
			{
				toggleBox('processDiv', 0);
				alert('Server error status [' + req.status + ']');
			}
		}
	}
	
	this.doGet = function()
	{
		req.open("GET", url, true);
		req.send(null);
	}
	
	this.doPost = function(body)
	{
		req.open("POST", url, true);
		req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		req.send(body);
	}
	
	this.doPostMT = function(body)
	{
		req.open("POST", url, true);
		req.setRequestHeader("Content-Type", "multipart/form-data; charset=UTF-8");
		req.send(body);
	}
}

/*

------------ Funciones para manipulación de divs

*/
function fillContainer(results, containerId, sndcallback)
{
	setMessage(containerId, Trim(results));
	
	if (sndcallback) sndcallback();
}

function setMessage(containerId, msg)
{
	if (document.getElementById(containerId) != null)
	{
		document.getElementById(containerId).innerHTML = msg;
	}
}

/** oculta o muestra un div
* @param containerId nombre del div
* @param iState estado del div: 1 visible, 0 hidden
* <div id="processDiv" align="center"><img src="images/iLoading.gif"> Procesando</div>
*/
function toggleBox(containerId, iState)
{
	//Logger.debug("fn toggleBox, container [" + containerId + "] action [" + (iState ? "show" : "hide") + "]");

	if(document.layers)
	{						//NN4+
		document.layers[containerId].visibility = iState ? "show" : "hide";
	}
	else if(document.getElementById)
	{		//gecko(NN6) + IE 5+
		var obj = document.getElementById(containerId);
		
		if (obj != null)
			obj.style.visibility = iState ? "visible" : "hidden";
	}
	else if(document.all)
	{					// IE 4
		document.all[containerId].style.visibility = iState ? "visible" : "hidden";
	}
}

function encodeL(text)
{
	text = encodeURIComponent(text);
	return text;
	
//escape() 				will not encode: @*/+
//encodeURI() 			will not encode: ~!@#$&*()=:/,;?+'
//encodeURIComponent() 	will not encode: ~!*()'
}

function decodeL(text)
{
	text = decodeURIComponent(text);
	return text;
}