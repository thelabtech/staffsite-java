<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Help and Resources"; %>

<%@ include file="wsnspheader.jspf" %>
<p> &nbsp;
<table width='100%' border='1' cellpadding=5 bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr valign='top'><td>
	<p> &nbsp;
	<%=fontText%>
	<a name=top></a>We've provided a number of resources here to help you provide leadership for your
	project. If you have questions that are not addressed in these pages, or would
	like to suggest additional resources for these pages, please contact us by <a href='mailto:wsn@uscm.org'>e-mail</a>
	or call us at (407) 826-2525.
<p>

<table border="0" width="100%">
  <tr>
    <td valign=top width="28%"><%=fontText%><b>Q &amp; A Sections:</font></b><BR><BR>
&nbsp;</td>
    <td width="72%">
	<a href=#tool>Using the tool:</a><BR>
		<li><A HREF="#tool-a">Creating a project</A></li>
		<li><A HREF="#tool-b">Filling out a project record</A></li>
		<li><A HREF="#tool-c">Assigning leaders</A></li>
		<li><A HREF="#tool-d">My personal record</A></li>
		<li><A HREF="#tool-e">Entering applicants</A></li>
		<li><A HREF="#tool-j">Adding Children</A></li><br>
		<li><A HREF="#tool-f">Deleting applicants</A></li>
		<li><A HREF="#tool-g">Making Changes</A></li>
		<li><A HREF="#tool-h">Account numbers</A></li>
		<li><A HREF="#tool-i">Viewing applicant info</A></li>
		<li><A HREF="#tool-z">General questions</A></li><br>
	<a href=#cool>Cool ways this tool can help you:</a><BR>
	<a href=#access>Access to the site:</a><BR>
	<a href=#resources>Resources:</a><BR>
	<a href=#processing>Processing applications:</a><BR>
	<a href=#planning>Planning and preparation:</a><BR>
	<a href=#new>Recent Additions/Changes:</a><BR><br>
</td>
  </tr>
</table>
<%=fontText%><b><a name=tool>Using the tool:</a></font></b>
<%=fontB%>
<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><B><a name=tool-a></a><B>Creating a Project</B></b></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul>
	<%=fontText%><li><B>Q: </B>How do I create a project?
	</font><br><B>A:</B> Go to the regional page and click the "Add Project" button. Fill out the form and hit "Save."</li><br>
</ul>
<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><B><a name=tool-b></a><B>Filling out a project record</B></b></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul>	<%=fontText%><li><B>Q: </B>How do I fill out the information for my project?
	</font><br><B>A:</B> Go to your project's record and hit "view project info," then hit "edit this project's information"
	near the bottom right-hand corner. Fill out the form and hit "save."</li><br>
	<%=fontText%><li><B>Q: </B>How do I fill out the travel information for my project?
	</font><br><B>A:</B> Go to  your project's record and hit "view project info," then hit "go to travel page" near the
	bottom right-hand corner. Fill out the form and hit "save."</li><br>
	<%=fontText%><li><B>Q: </B>Is the travel information required?
	</font><br><B>A:</B> If you are working with Greg Angstrom in the travel department,
	this page will be helpful for him. The most important thing, though, is that the names
	of all your project participants are entered in the SPT the way they appear in their
	passports. This includes children. This way, Greg can get the information he needs straight
	from the SPT and you won't have to email it to him separately.</li><br>
</ul>
<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><B><a name=tool-c></a><B>Assigning leaders</B></b></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul><%=fontText%><li><B>Q: </B>When assigning PDs and APDs can I match singles up?
	</font><br><B>A:</B> Go for it.</li><br>
	<%=fontText%><li><B>Q: </B>I wanted to change the leadership for my project, so I clicked the "change leaders" link on the 
	"view project info" page. But the person that I want to make a leader doesn't show up in the pull down menu. Why?
	</font><br><B>A:</B> Because he or she is not in the database yet. If you need to have the person added to the database as 
	a leader, <a href="mailto:wsn@uscm.org">email us</a> and we will have them added. Once the person is in the database, they 
	will be listed in the pull down menu so that they are among the options for who you can change a leader to.<BR>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The "change leaders" link is designed for situations such as the following...
	<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A project participant (who is presumably already in the 
	database; could be staff or a student) gets "promoted" to a leadership position
	<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A leader who has already been assigned to one project 
	gets switched to another project.
	</li><br>
</ul>

<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><B><a name=tool-d></a><B>My personal record</B></b></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul>	<%=fontText%><li><B>Q: </B>Why doesn't my personal record have a state in my address?
	</font><br><B>A:</B> Because when we originally added all the leaders, there was a bug in the tool that caused it to forget 
	to suck in the state from your record in Peoplesoft. It works now for leaders who are added, but it doesn't retroactively 
	suck, so you'll have to go in there and put in your own state.
	<BR>(we really just included this question because we wanted to use the term "retroactively suck.")
	</li><br>
	<%=fontText%><li><B>Q: </B>My personal record is inaccurate. Why?
	</font><br><B>A:</B> Because when you were added to the database, it slurped in whatever information is in your PeopleSoft 
	record. You can edit your record in the SPT here on the website, but to update your PeopleSoft record, you have to fill out 
	a <a href="http://staff.campuscrusadeforchrist.com/cms/content/00000057274.pdf" target='_blank'>Personal Information Update 
	Form</a> and mail it to Staff Services. The mailing address is on the form.</li><br>
</ul>

<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><B><a name=tool-e></a><B>Entering applicants</B></b></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul>	<%=fontText%><li><B>Q: </B>I entered ten applicants for my project, but they don't show up on the project roster. Why?
	</font><br><B>A:</B> Probably because they don't have a project assignment. You can retrieve their records by using the 
	"Search people" feature. On the search screen, type the person's first and/or last name into the appropriate field, 
	and hit the "search" button. If the person is in the database, it will pull up their record. Scroll to the bottom of the 
	record and hit the "edit" button. Scroll down to the "Project Preferences" area, and choose the appropriate project for 
	the "Assigned Project" field. Hit "save." The person should now appear on your roster.
	<BR><BR>
	There was a short period (2 - 3 days) when the tool wasn't assigning people to projects correctly, so this could be the 
	reason that your person didn't get a project assignment, or didn't get the right assignment.
	</li><br>
	<%=fontText%><li><B>Q: </B>What should I do if a student doesn't fill in all five project preferences? If I leave any of 
	them blank on the form, I get an error message that says I need to complete the preferences portion.
	</font><br><B>A:</B>You can put in the same project for multiple preferences. For example, if the student only writes 
	in one project, just put it for all five preferences. If they write in, say, three, just put the third one down for the 
	fourth and fifth preferences as well.</li><br>
	<%=fontText%><li><B>Q: </B>What if some of the student's top five preferences are US Summer Projects?
	</font><br><B>A:</B>Just choose "US Summer Project" from the pull down menu. It doesn't list the specific US 
	projects because for our purposes, all we really need to know is that the preference was a US project.</li><br>
	<%=fontText%><li><B>Q: </B>What if I can't place the student on the project for which I'm evaluating his/her 
	application, but their next preference is a US Summer Project?
	</font><br><B>A:</B>See the <a href="http://staff.campuscrusadeforchrist.com/cms/content/00000038954.doc" target='_blank'>applicant processing
	flowchart</a>. </li><br>
	<%=fontText%><li><B>Q: </B>What Campus Region should I indicate for people who don't come from a specific Campus Region?
	</font><br><B>A:</B> Choose "Nat'l Campus Office."</li><br>
	<%=fontText%><li><B>Q: </B>Do we have to enter students into the SPT database if we aren't accepting them?
	</font><br><B>A:</B> Yes---we want to have accurate records of who applied, and who was/wasn't accepted for what projects. 
	We're also hoping to begin keeping this information on file so that if they apply for a project in the future, we have a 
	record of their past application.</li><br>
</ul>

<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><a name=tool-j></a><B>Adding Children</B></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul>	<%=fontText%><li><B>Q: </B>How can I be sure that children going on my project will get SOS coverage, airline tickets, etc.?
	</font><br><B>A:</B> 

	To ensure that everyone, including children, gets set up with all the things they need
	including SOS coverage, they must be IN THE DATABASE and ASSIGNED TO YOUR PROJECT. The
	person who sets up SOS looks at a report from your project roster to get all the names
	to set up. This could also affect such things as airline ticketing, if you are working
	with Greg Angstrom and World Travel. Basically, any time someone is looking at a report
	of your project on the SPT so that they can set something up for your project, any person
	(including children) who is not on your roster won't get set up.
	<p>
	Here's how to make sure children are in the database and assigned to your project: 
	<ul>
		If you look at your project roster on the SPT and you can see the children's names
		on the list, this means that they are in the database and assigned to your project.
		You are in good shape.
		<p>
		If not, here is what you need to do: 
		<p>
		<B>1. Open up your project roster, and click the magnifying glass beside the name of the
		father of the child or children. (The mother would work too, but for simplicity's sake
		just use the father.) This will display the father's personal record.</B>
		<p>
		<B>2. Look at the right hand side of the screen, underneath the "married to" heading (if
		there is no "married to" heading, this means the person's marital status has been
		indicated as "single," and you'll need to change that first). If there is ALSO a 
		heading for "children" and you see the children's names underneath, this means that
		the person's children are in the database but still need to be accepted and assigned
		to the project. If this is the case...</B>
		<p>
		2a. Click the "update" link underneath the child(ren)'s name(s). This will take you
		to a page that will list the names of all the person's children. Beside each name, 
		there will be a magnifying glass.
		<p>
		2b. For each child, click the magnifying glass to view their record, then hit the 
		"edit" button. This pulls up the edit screen for that child. 
		<p>
		2c. Scroll down to "Assigned Project," and choose the appropriate project from the
		list. Also, make sure the "applicant status" near the bottom of the record is indicated
		as "accepted." In order to save the record, the system will also require you to enter
		an email address for the child. Just enter the parent's email address. Hit "save" to 
		save the record, and  you should be good to go. 
		<p>
		2d. Repeat for each child.
		<p>
		<B>3. If there is a heading for children on the father's record but it says "no children
		associated," click the "update" link and follow the instructions to add children. 
		Please note that the system doesn't automatically assign children to projects or
		accept them. You will need to get to the "edit" screen for each child and indicate 
		their project assignment and the fact that they are accepted on that project.</B>
		<p>
		<B>4. If there is no heading for children, this means that the father's record indicates
		that he is not bringing children on the project. To correct this...</B>
		<p>
		4a. Hit the "edit" button, find the "children going also" field near the bottom of the
		record, and change it to "yes." 
		<p>
		4b. Hit the "save" button. At this point, the system may require you to enter some
		information that wasn't entered at the time the father was originally put in the 
		database. Enter the information it asks for, then hit "save." 
		<p>
		4c. Now you should be able to add children according to the instructions in point 3,
		above. If, under "children," it says "To add children you must first add this person's
		spouse to the system and associate them," you can do that by clicking "find person's
		spouse" and choosing the spouse from the list on the next screen. 
	</ul>
</li><br>
</ul>

<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><B><a name=tool-f></a><B>Deleting applicants</B></b></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul>	<%=fontText%><li><B>Q: </B>I accidentally entered Joe Student five times. How can I get rid of four of them?
	</font><br><B>A:</B> You can't. Change the first name of four that you do not want to "Delete" and <a href="mailto:wsn@uscm.org">email us</a> to erase them.</li><br>
	<%=fontText%><li><B>Q: </B>One of my students withdrew from the project. He or she isn't going on a summer
	project any more. Can you delete him or her from the database?
	</font><br><B>A:</B> No. Just change the person's Applicant Status to "withdrawn." We want to keep accurate
	records of the number of applicants vs. the number who actually went.</li><br>
</ul>

<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><B><a name=tool-g></a><B>Making Changes</B></b></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul>	<%=fontText%><li><B>Q: </B>One of the people that was originally assigned to my project is changing to a
	different project. What do I do to make the person show up on the new project's roster?
	</font><br><B>A:</B> Go to their record, hit the "edit" button, change the "project assignment," and hit
	save. They should now disappear from the original roster and appear on the new project's roster.</li><br>
	<%=fontText%><li><B>Q: </B>A student who was originally assigned to a different project is joining my project.
	What do I do to make the person show up on my project's roster?
	</font><br><B>A:</B> See answer to previous question, above.</li><br>
	<%=fontText%><li><B>Q: </B>Should I create a new record for the student?
	</font><br><B>A:</B> No.</li><br>
	<%=fontText%><li><B>Q: </B>One of my students withdrew from the project. He or she isn't going on a summer
	project any more. Can you delete him or her from the database?
	</font><br><B>A:</B> No. Just change the person's Applicant Status to "withdrawn." We want to keep accurate
	records of the number of applicants vs. the number who actually went.</li><br>
</ul>

<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><B><a name=tool-h></a><B>Account numbers</B></b></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul>	<%=fontText%><li><B>Q: </B>Why don't my accepted applicants have account numbers yet?
	</font><br><B>A:</B>This is most likely either because the person's record is not complete (missing address, Social Security 
	Number, or project assignment), or your project's record is not complete (missing Scholarship Account number). In order to 
	assign account numbers to a student, Donation Services needs to know with which project account the student's account should 
	be associated.</li><br>
</ul>

<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><B><a name=tool-i></a><B>Viewing applicant info></b></b></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul>	<%=fontText%><li><B>Q: </B>When I click on "view" next to an applicant's name it comes up "null null." What's the problem?
	</font><br><B>A:</B> <a href="mailto:wsn@uscm.org">Email us</a> with more information on the error you got. What's the person's 
	name? Are they a member or leader? Is there any other error message on the screen? If so, what does it say? The more details 
	you can provide, the easier it will be for us to find the problem and figure out if it is affecting others also.</li><br>
</ul>


<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><a name=tool-z></a><B>General questions</B></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul>	<%=fontText%><li><B>Q: </B>I can't figure out how to (change my project information, edit my applicants, whatever it is that 
	you're trying to do). Here's the information...Can you do it for me?
	</font><br><B>A:</B> No. If you absolutely can't figure it out or if you missed the training time in Colorado, contact your 
	regional office and ask if there's someone who can help you over the phone. If not, <a href="mailto:wsn@uscm.org">email us</a> 
	and we'll set up a phone appointment to walk through it together.</li><br>
</ul>

<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><B><a name=cool>Questions about cool ways this tool can help you:</a></b></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul>
	<%=fontText%><li><B>Q: </B>Our region is having a conference for all the people that are going on summer
	projects, and we need to get an accurate head count. How can I use the tool to
	do this?
	</font><br><B>A:</B> Go to &quot;search people.&quot; For your search criteria, choose your
	region, and then for &quot;Applicant Status,&quot; choose &quot;Accepted.&quot;
	Hit the &quot;search&quot; button. In two or three seconds, you will have a list
	of everyone going on projects in your region.</li><br>
</ul>
<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><B><a name=access>Questions about access to the site:</a></b></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul>
	<%=fontText%><li>(we assume you're asking on behalf of your friend, because obviously you have
	access to the site if you're on this page!)</font></li><br>
	<%=fontText%><li><B>Q: </B> My friend can't get on the Staff Site.
	</font><br><B>A:</B> Tell your friend to e-mail <a href="mailto:help@campuscrusadeforchrist.com">help@campuscrusadeforchrist.com</a>.</li><br>
	<%=fontText%><li><B>Q: </B>When my friend goes to the WSN SPT page, they get a &quot;sorry&quot;
	message.
	</font><br><B>A:</B> If your friend needs access to the tool, have them e-mail <a href="mailto:wsn@uscm.org">wsn@uscm.org</a> to
	request access.</li><br>
</ul>
<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><B><a name=resources>Questions about resources:</a></b></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul>
	<%=fontText%><li><B>Q: </B>East Asia uses a tool about making friends and getting into spiritual
	discussions but I can't find where that is. Who do I ask for help with that?
	</font><br><B>A:</B> For this or any other resource you may be looking for, check the &quot;<A HREF="https://staff.campuscrusadeforchrist.com/servlet/CmsController?action=browse&catId=00000000740" target='_blank'>Resource Center (WSN section)</a>.&quot; The link
	is near the top of this page in the right-hand column. If you don't find what
	you're looking for, <a href="mailto:wsn@uscm.org">email us</a>
	and let us know.</li><br>
	<%=fontText%><li><B>Q: </B>I was looking in the resource area for a document, and when I clicked on the
	link for the document and pulled up the page, it said that the summary is not
	available. How do I get the document?
	</font><br><B>A:</B> The &quot;summary&quot; is just a short description of the document.
	Sometimes, if the person who uploaded the document (Amy Weiss, for example, but
	we won't mention her name) was too lazy to type in a summary statement, it will
	say &quot;Summary not available.&quot; But the summary isn't really what you
	want, anyway---you want the document itself. You can download the document by
	pressing the &quot;download&quot; button on the right side of the screen. If you
	want to save the document on your computer, click the &quot;download&quot;
	button with the right-hand button on your mouse.</li><br>
	<%=fontText%><li><B>Q: </B>Why isn't the Leaders' Notebook posted as one big document yet?
	</font><br><B>A:</B> We're having some difficulties doing this because some of the documents are
	Word documents, and others are PDFs. There's no way to put these all together
	into one document, so we have to retype the PDFs as Word documents, then combine
	them all, THEN post it. This takes a long time. We're really sorry this hasn't
	been done---for now you'll just have to download them individually.</li><br>
</ul>
<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><B><a name=processing>Questions about processing applications:</a></b></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul>
	<%=fontText%><li><B>Q: </B>What if I can't place the student on the project for which I'm evaluating his/her 
	application, but their next preference is a US Summer Project?
	</font><br><B>A:</B>See the <a href="http://staff.campuscrusadeforchrist.com/cms/content/00000038954.doc" target='_blank'>applicant processing
	flowchart</a>. </li><br>
	<%=fontText%><li><B>Q: </B>What are we supposed to do with the Application Fee checks?
	</font><br><B>A:</B> Send them to Donation Services at headquarters, with a note that says
	&quot;these checks need to be deposited into SPFEE.&quot; The address is:<br><BR>
	Campus Crusade for Christ
	Dept. 2400 - Donation Services<br>
	100 Lake Hart Drive<br>
	Orlando, FL 32832</li><br>
	<%=fontText%><li><B>Q: </B>What do I do with the application if I can't take the person on my project?
	</font><br><B>A:</B> Refer to the <a href="http://staff.campuscrusadeforchrist.com/cms/content/00000038954.doc" target='_blank'>applicant processing
	flowchart</a>. If you still don't know
	what to do, <a href="mailto:wsn@uscm.org">email us</a>.</li><br>
</ul>

<table border="0" width="100%">
  <tr>
    <td width="80%" align="left"><%=fontText%><B><a name=planning>Questions about planning and preparation:</a></b></font></td>
    <td width="20%" align="right"><%=fontB1%><a href="#top">Back to Top</a>&nbsp;</font></td>
  </tr>
</table>
<ul>
	<%=fontText%><li><B>Q: </B>What do I need to do to register my students and staff for SOS insurance?
	</font><br><B>A:</B> If all of your students and staff have records in the SPT and they are assigned
	to your project, AND your project information is filled out and accurate (see "<A HREF="#tool-b">filling out a project record</A>"),
	they will be automatically registered for SOS. You don't have to do anything.</li><br>
	<%=fontText%><li><B>Q: </B>What do I need to do to make sure my students have CCC medical insurance?
	</font><br><B>A:</B> All the students (not staff) need to fill out the <A HREF="http://staff.campuscrusadeforchrist.com/cms/content/00000039563.doc" target='_blank'>Insurance Enrollment Form</A>.
	Once all the insurance enrollment forms are back to you, send them, stacked in alphabetical order by last name, to the following address:<br>
	 &nbsp; &nbsp; Marcia Rust<br>
	 &nbsp; &nbsp; Campus Crusade for Christ<br>
	 &nbsp; &nbsp; Dept. 3900<br>
	 &nbsp; &nbsp; 100 Lake Hart Drive<br>
	 &nbsp; &nbsp; Orlando, FL 32832<br>
	The SPT will do the rest for you.</li><br>
	<%=fontText%><li><B>Q: </B>The information on the public web site (www.uscm.org) about my project isn't accurate
	(or there is no information about my project). How can this be fixed?
	</font><br><B>A:</B> Email the information about your project to the <A HREF="mailto:nathan.dunn@uscm.org">Campus Communications Team</A>.
	They can post it on the public site for you.</li><br>
	<%=fontText%><li><B>Q: </B>Is someone coordinating all the flights for the OEXA projects?
	</font><br><B>A:</B> Yes, contact Donny Wilcox.</li><br>
	<%=fontText%><li><B>Q: </B>Who is coordinating the OEX A briefing?
	</font><br><B>A:</B> Donny Wilcox.</li><br>
	<p>&nbsp;</p>
	</font>
</ul>
<BR>
<p>
<A name="new"></A><%=fontText%><b>Recently Added/Fixed</font></b>
<%=fontS%>
<p>
	<%=fontTextS%><b>7/23/01</b><br></font>
	<li>Fixed the links that changed due to new staff site design.</font> </li>
	<li>New help email box (help@campuscrusadeforchrist.com) instead of the old systems.feedback</font> </li>
	<p>
	<%=fontTextS%><b>4/16/01</b><br></font>
	<li>Trying to void an account number now works in case you put in a wrong one.</font> </li>
	<p>
	<%=fontTextS%><b>2/01/01</b><br></font>
	<li>Spouse Linking <%=fontTextS%><I><B>Working</B></I></font> </li>
	<li>Changing leadership of projects <%=fontTextS%><I><B>Working</B></I></font> </li>
	<p>
	<%=fontTextS%><b>1/26/01</b><br></font>
	<li>Changing the project assignment of applicants. <%=fontTextS%><I><B>FIXED</B></I></font> </li>
</td>
</tr>
</table>

<%@ include file="wsnspfooter.jspf" %>

</HTML>