
var lastOpen="";
function show(personID){
	hide();
	document.getElementById(personID+"_leader_status").style.display='inline';
	lastOpen=personID;
}
function hide(){
	if (lastOpen!==""){
	document.getElementById(lastOpen+"_leader_status").style.display='none';
	}
}
var active = " has an active CCC<BR>movement, usually with ten or more students.";
var inactive = " has no active Campus Ministry strategy <br>or potential student leader at the Ministry Location.";
var pioneering = " is actively doing something<BR>to start a ministry at this Ministry Location.";
var keycontact = " has found a key contact at this<BR>Ministry Location - student, volunteer, or partner.";
var keyleader = " has found a key leader at this<BR>Ministry Location - student, volunteer, or partner.";
var launched = " has a critical mass of five<BR>students, staff coach, etc.";
var transformational = " has a movement of 50 or more students<BR>involved, or 1% of the student body.";
var multiplying = " has a movement of 50 or more students<BR>involved, or 1% of the student body.";
var forerunner = " has a person who can resource<BR>this Ministry Location to move it to the next level.";
var staffed = " has staff assigned to this Ministry Location<BR>who report through the Staffed Campuses lane.";
var transitioned = " has passed this movement over <br>to local leaders.";
var empty = "Move your mouse pointer over a <BR>capitalized word to see a short explanation.";

function setDefinition(setTo,strategy) {
	if (strategy==null){
		document.getElementById('definition').innerHTML =empty;
	}
	else
	{
    document.getElementById('definition').innerHTML = strategy+" "+setTo;
	}

}
var checkSentTeam=false;
function submitForm() {
	if ((checkSentTeam&&document.updateActivityForm.sent_teamID.options[document.updateActivityForm.sent_teamID.selectedIndex].value == "")||
		(checkSentTeam&&document.updateActivityForm.teamid.options[document.updateActivityForm.teamid.selectedIndex].value == "") )
				{
					alert("You must select a Sent Team and a Supervising a Missional Team.");
				
		}
	else if (document.updateActivityForm.teamid.options[document.updateActivityForm.teamid.selectedIndex].value == "") 
	{
		alert("You must select a Missional Team.");
		}
	else {
		document.getElementById('subber').disabled=true;
		document.updateActivityForm.submit();
	}
}

	var checked=false;
	function check(){
	table=document.getElementById('boxes');
	inputs = table.getElementsByTagName('input');
		for (i=0;i<inputs.length;i++){
		inputs[i].checked=!checked;
		}
		checked=!checked;
		document.getElementById('checkAllButton').src=(checked?'/modules/images/unCheckAll.gif':'/modules/images/checkAll.gif');
	}
	function checkAll(){
		table=document.getElementById('boxes');
		inputs = table.getElementsByTagName('input');
			for (i=0;i<inputs.length;i++){
			inputs[i].checked=true;
			}
			checked=true;
			document.getElementById('checkAllButton').src='/modules/images/unCheckAll.gif';
		}
	function checkEvents(){
		document.getElementById("C2").checked=true;
		document.getElementById("SP").checked=true;
	}



		function submitReportForm(thisForm) {
			var choices = 0;
			for (i = 0; i < thisForm.strategies.length; i++) {
				if (thisForm.strategies[i].checked) {
					choices++;
				}
			}		
			if ( choices > 0 ) {
				return true;
			}
			else {
				alert("You must check at least one strategy");
				return false;
			}
		}
		function setSortOrder(type)
		{
		var tdWidth="200px";
		if(type=="movement")
			{
			
			document.getElementById('order[a]').value="campus";
			document.getElementById('order[b]').value="strategy";
			document.getElementById('order[c]').value="";
			document.getElementById('order[d]').value="";
			document.getElementById('order[e]').value="";
			document.getElementById('order[f]').value="";
			document.getElementById('order[g]').value="";
			document.getElementById('order[h]').value="";
			document.getElementById('option[-1]').style.display="inline";
			document.getElementById('option[-2]').style.display="inline";
			document.getElementById('option[0]').style.display="inline";
			document.getElementById('option[1]').style.display="inline";
			document.getElementById('option[2]').style.display="none";
			document.getElementById('option[3]').style.display="none";
			document.getElementById('option[4]').style.display="none";
			document.getElementById('option[5]').style.display="none";
			document.getElementById('optionLabel[0]').style.display="inline";
			document.getElementById('optionLabel[1]').style.display="inline";
			document.getElementById('blankCell[0]').style.display="none";
			document.getElementById('blankCell[1]').style.display="none";
			document.getElementById('blankLabelCell[0]').style.display="none";
			document.getElementById('blankLabelCell[1]').style.display="none";
			
			}
		else if(type=="location")
			{
			
				document.getElementById('order[a]').value="";
			document.getElementById('order[b]').value="";
			document.getElementById('order[c]').value="";
			document.getElementById('order[d]').value="";
			document.getElementById('order[e]').value="campus";
			document.getElementById('order[f]').value="";
			document.getElementById('order[g]').value="";
			document.getElementById('order[h]').value="";
			document.getElementById('option[0]').style.display="none";
			document.getElementById('option[1]').style.display="none";
			document.getElementById('option[-1]').style.display="none";
			document.getElementById('option[-2]').style.display="none";
			document.getElementById('option[2]').style.display="inline";
			document.getElementById('option[3]').style.display="inline";
			document.getElementById('option[4]').style.display="none";
			document.getElementById('option[5]').style.display="none";
			document.getElementById('optionLabel[0]').style.display="none";
			document.getElementById('optionLabel[1]').style.display="none";
			
			document.getElementById('blankCell[0]').style.width=tdWidth;
			document.getElementById('blankCell[1]').style.width=tdWidth;
			document.getElementById('blankLabelCell[0]').style.width=tdWidth;
			document.getElementById('blankLabelCell[1]').style.width=tdWidth;
			document.getElementById('blankCell[0]').style.display="inline";
			document.getElementById('blankCell[1]').style.display="inline";
			document.getElementById('blankLabelCell[0]').style.display="inline";
			document.getElementById('blankLabelCell[1]').style.display="inline";
			}
		else if(type=="team")
			{
			
			document.getElementById('order[a]').value="";
			document.getElementById('order[b]').value="";
			document.getElementById('order[c]').value="";
			document.getElementById('order[d]').value="";
			document.getElementById('order[e]').value="";
			document.getElementById('order[f]').value="";
			document.getElementById('order[g]').value="team";
			document.getElementById('order[h]').value="";
			document.getElementById('option[0]').style.display="none";
			document.getElementById('option[1]').style.display="none";
			document.getElementById('option[-1]').style.display="none";
			document.getElementById('option[-2]').style.display="none";
			
			document.getElementById('option[2]').style.display="none";
			document.getElementById('option[3]').style.display="none";
			document.getElementById('option[4]').style.display="inline";
			document.getElementById('option[5]').style.display="inline";
			document.getElementById('optionLabel[0]').style.display="none";
			document.getElementById('optionLabel[1]').style.display="none";
			
			document.getElementById('blankCell[0]').style.width=tdWidth;
			document.getElementById('blankCell[1]').style.width=tdWidth;
			document.getElementById('blankLabelCell[0]').style.width=tdWidth;
			document.getElementById('blankLabelCell[1]').style.width=tdWidth;
			document.getElementById('blankCell[0]').style.display="inline";
			document.getElementById('blankCell[1]').style.display="inline";
			document.getElementById('blankLabelCell[0]').style.display="inline";
			document.getElementById('blankLabelCell[1]').style.display="inline";
			}
		}
		//------------------------------
		// Date function opicking tool
		// Usage: onFocus="pickdate(this)"
		//------------------------------
		var theDateElement;

		function pickdate(element) {
			theDateElement = element;
			theDateElement.blur();
			myFloater = window.open('','DatePicker','resizable=no,scrollbars=no,width=250,height=230');
			var goTo = "/selday.jsp";
			if (theDateElement.value!=null){goTo=goTo+'?date='+theDateElement.value;}
			myFloater.location.href = goTo;
		}

		function pickdatePicker(element) {
			theDateElement = element;
				myFloater = window.open('/crs/pickday.jsp','DatePicker','resizable=no,scrollbars=no,width=325,height=50');
		}

		function setdate(theDate) {
			theDateElement.value=theDate;
			theDateElement.blur();
		}
		//------------------------------

		