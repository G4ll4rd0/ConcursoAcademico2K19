/**
 * 
 */

function browse(frmAction, keyId)
{
	if (frmAction == null) frmAction = '';
	if (keyId == null) keyId = '';
	
	var url = page + 'Browse.jsp';
	
	var callback = fillContainer;
	var sndcallback	= onAjaxLoad;
	
	var ai = new AJAXInteraction(url, callback, 'workarea', sndcallback);

	var parameters = '';
	parameters	+= 'frmAction=' + encodeL(frmAction);
	parameters	+= '&keyId=' + encodeL(keyId);
	//parameters += readFormParams(theFilters);
	//parameters += readFormParams(theForm);
	
	//Logger.debug("parametros para ajax [" + parameters + "]");

	ai.doPost(parameters);
}

//Si es cargado por AJAX, se manda esta funcion para cargarlo despues de traer contenido
function onAjaxLoad()
{
	//Esta funcion ejecutaba el script para el encabezado de la tabla
	//no requerido
}

/*
==================================================================
LTrim(string) : Returns a copy of a string without leading spaces.
==================================================================
*/
function LTrim(str)
/*
   PURPOSE: Remove leading blanks from our string.
   IN: str - the string we want to LTrim
*/
{
   var whitespace = new String(" \t\n\r");

   var s = new String(str);

   if (whitespace.indexOf(s.charAt(0)) != -1) {
      // We have a string with leading blank(s)...

      var j=0, i = s.length;

      // Iterate from the far left of string until we
      // don't have any more whitespace...
      while (j < i && whitespace.indexOf(s.charAt(j)) != -1)
         j++;

      // Get the substring from the first non-whitespace
      // character to the end of the string...
      s = s.substring(j, i);
   }
   return s;
}

/*
==================================================================
RTrim(string) : Returns a copy of a string without trailing spaces.
==================================================================
*/
function RTrim(str)
/*
   PURPOSE: Remove trailing blanks from our string.
   IN: str - the string we want to RTrim

*/
{
   // We don't want to trip JUST spaces, but also tabs,
   // line feeds, etc.  Add anything else you want to
   // "trim" here in Whitespace
   var whitespace = new String(" \t\n\r");

   var s = new String(str);

   if (whitespace.indexOf(s.charAt(s.length-1)) != -1) {
      // We have a string with trailing blank(s)...

      var i = s.length - 1;       // Get length of string

      // Iterate from the far right of string until we
      // don't have any more whitespace...
      while (i >= 0 && whitespace.indexOf(s.charAt(i)) != -1)
         i--;


      // Get the substring from the front of the string to
      // where the last non-whitespace character is...
      s = s.substring(0, i+1);
   }

   return s;
}

/*
=============================================================
Trim(string) : Returns a copy of a string without leading or trailing spaces
=============================================================
*/
function Trim(str)
/*
   PURPOSE: Remove trailing and leading blanks from our string.
   IN: str - the string we want to Trim

   RETVAL: A Trimmed string!
*/
{
   return RTrim(LTrim(str));
}