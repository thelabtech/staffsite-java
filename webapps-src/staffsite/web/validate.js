<SCRIPT LANGUAGE="JavaScript"><!--

var defaultEmptyOK = false;
var failed = false;
var errorMessage;
var errorMessage2;

function warnEmpty (theField, s)
{   theField.focus();
    alert(mPrefix + s + mSuffix);
    return false;
}

function warnInvalid (theField, s)
{   alert("You need to put a number here.");
	theField.value="";
	theField.focus();
    return false;
}

// Check whether string s is empty.

function isEmpty(s)
{   return ((s == null) || (s.length == 0) || (s == " "));
}

function isDigit(num) {
	var string="1234567890";
	if (string.indexOf(num) != -1) {
		return true;
		}
	return false;
}

function isInt(val) {
	for (var i=0; i < val.length; i++) {
		if (!isDigit(val.charAt(i))) { return false; }
		}
	return true;
}

function isIntegerWithMessage(field, string) {
	var returnVal = isInt(field.value);
	if(!returnVal) {
		errorMessage = errorMessage + "\n" + string;
		failed = true;
	}
}

function emptyCheck(theField,s) {
	if (isEmpty(theField.value)) {
		errorMessage = errorMessage + "\n" + s;
		theField.focus();
		failed = true;
	}
}

function selectedCheck(theField,s) {
	if (theField.selectedIndex == 0) {
		errorMessage = errorMessage + "\n" + s;
		theField.focus();
		failed = true;
	}
}

function textCounter(field, maxlimit) {
	/* usage: onKeyDown="textCounter(this.form.message,125);" onKeyUp="textCounter(this.form.message,125);" */
	if (field.value.length > maxlimit) // if too long...trim it!
		field.value = field.value.substring(0, maxlimit);
}

// Returns true if character c is a digit 
// (0 .. 9).

function isDigit (c) {
	return ((c >= "0") && (c <= "9"));
}

// isInteger (STRING s [, BOOLEAN emptyOK])
// 
// Returns true if all characters in string s are numbers.
//
// Accepts non-signed integers only. Does not accept floating 
// point, exponential notation, etc.
//
// We don't use parseInt because that would accept a string
// with trailing non-numeric characters.
//
// By default, returns defaultEmptyOK if s is empty.
// There is an optional second argument called emptyOK.
// emptyOK is used to override for a single function call
//      the default behavior which is specified globally by
//      defaultEmptyOK.
// If emptyOK is false (or any value other than true), 
//      the function will return false if s is empty.
// If emptyOK is true, the function will return true if s is empty.
//
// EXAMPLE FUNCTION CALL:     RESULT:
// isInteger ("5")            true 
// isInteger ("")             defaultEmptyOK
// isInteger ("-5")           false
// isInteger ("", true)       true
// isInteger ("", false)      false
// isInteger ("5", false)     true

function isInteger (s)

{   var i;

	if (isEmpty(s)) 
	   if (isInteger.arguments.length == 1) return defaultEmptyOK;
	   else return (isInteger.arguments[1] == true);

	// Search through string's characters one by one
	// until we find a non-numeric character.
	// When we do, return false; if we don't, return true.

	for (i = 0; i < s.length; i++)
	{   
	// Check that current character is number.
	var c = s.charAt(i);

	if (!isDigit(c)) return false;
	}

	// All characters are numbers.
	return true;
}
	
// isIntegerInRange (STRING s, INTEGER a, INTEGER b [, BOOLEAN emptyOK])
// 
// isIntegerInRange returns true if string s is an integer 
// within the range of integer arguments a and b, inclusive.
// 
// For explanation of optional argument emptyOK,
// see comments of function isInteger.

function isIntegerInRange (s, a, b)
{   if (isEmpty(s)) 
	   if (isIntegerInRange.arguments.length == 1) return defaultEmptyOK;
	   else return (isIntegerInRange.arguments[1] == true);

	// Catch non-integer strings to avoid creating a NaN below,
	// which isn't available on JavaScript 1.0 for Windows.
	if (!isInteger(s, false)) return false;

	// Now, explicitly change the type to integer via parseInt
	// so that the comparison code below will work both on 
	// JavaScript 1.2 (which typechecks in equality comparisons)
	// and JavaScript 1.1 and before (which doesn't).
	var num = parseInt (s);
	return ((num >= a) && (num <= b));
}


function isDate (s){  
	if (isEmpty(s)) return true;

	if (!isIntegerInRange(s.charAt(0), 0, 1)) return false;
	else if ((s.charAt(0) == "1") && (!isIntegerInRange(s.charAt(1), 0, 2))) return false;
	else if ((s.charAt(0) == "0") && (!isIntegerInRange(s.charAt(1), 1, 9))) return false;
	else if (s.charAt(2) != "/") return false;
	else if (!isIntegerInRange(s.charAt(3), 0, 3)) return false;
	else if ((s.charAt(0) == "0") && (s.charAt(1) == "2") && (s.charAt(3) == "3")) return false;		
	else if ((s.charAt(3) == "3") && (!isIntegerInRange(s.charAt(4), 0, 1))) return false;
	else if ((isIntegerInRange(s.charAt(3), 0, 2))  && (!isIntegerInRange(s.charAt(4), 0, 9))) return false;
	else if ((s.charAt(3) == "0") && (s.charAt(4) == "0")) return false;
	else if (s.charAt(5) != "/") return false;
	else if (!isIntegerInRange(s.charAt(6), 0, 9)) return false;
	else if (!isIntegerInRange(s.charAt(7), 0, 9)) return false;
	else return true;
}

function isDateMMDDYYYY (s){  
	if (isEmpty(s)) return true;

	if (!isIntegerInRange(s.charAt(0), 0, 1)) return false;
	else if (!isIntegerInRange(s.charAt(6), 1, 2)) return false;
	else if ((s.charAt(0) == "1") && (!isIntegerInRange(s.charAt(1), 0, 2))) return false;
	else if ((s.charAt(0) == "0") && (!isIntegerInRange(s.charAt(1), 1, 9))) return false;
	else if (s.charAt(2) != "/") return false;
	else if (!isIntegerInRange(s.charAt(3), 0, 3)) return false;
	else if ((s.charAt(0) == "0") && (s.charAt(1) == "2") && (s.charAt(3) == "3")) return false;		
	else if ((s.charAt(3) == "3") && (!isIntegerInRange(s.charAt(4), 0, 1))) return false;
	else if ((isIntegerInRange(s.charAt(3), 0, 2))  && (!isIntegerInRange(s.charAt(4), 0, 9))) return false;
	else if ((s.charAt(3) == "0") && (s.charAt(4) == "0")) return false;
	else if (s.charAt(5) != "/") return false;
	// we're only gonna allow with 20th & 21st Century dates
	else if ((s.charAt(6) == "1") && (s.charAt(7) != "9")) return false;
	else if ((s.charAt(6) == "2") && (s.charAt(7) != "0")) return false;
	else if (!isIntegerInRange(s.charAt(8), 0, 9)) return false;
	else if (!isIntegerInRange(s.charAt(9), 0, 9)) return false;
	else return true;
}

//--></SCRIPT>
