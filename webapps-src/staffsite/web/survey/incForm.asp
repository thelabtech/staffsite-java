<%
Public Function tofield(s) 'helper function to handle special characters
 If (len(s) > 0) and not isnull(s) Then  'Make sure there's some text to adjust
   s=CStr(s) 'Make sure we're looking at it as a string
   s=Replace(s,"&","&amp;")  'Escape the ampersands
   s=Replace(s,"<","&lt;")  'Escape the "<" char
   s=Replace(s,">","&gt;")  'Escape the ">" char
   s=Replace(s,"""","&quot;")  'Escape the quote char
   s=Replace(s,"'","&#39;")  'Escape the single quote char
 End If
End function

Public Function BChecked(b) 'returns "CHECKED" if the boolean argument is true
 If b=True then BChecked="CHECKED"
End Function

Public Function SChecked(s1, s2) 'returns "CHECKED" if the strings match
 If s1=s2 then SChecked="CHECKED"
End Function

Public Function SSelected(s1, s2) 'returns "SELECTED" if the strings match
 If s1=s2 then SSelected="SELECTED"
End Function

Public function SelRS(oRS,sdefault) 'creates all the OPTION items for a SELECT form item from the provided RS. If sdefault is encountered, write SELECTED.
  if oRS.fields.count = 1 then
   do until oRS.EOF ' cycle through the recordset
     SelRS = SelRS & "<option value=" & oRS(0) & " " & sSelected(sdefault,oRS(0)) & ">" & oRS(0)
	 oRS.movenext
   loop
  else
   do until oRS.EOF ' cycle through the recordset
     SelRS = SelRS & "<option value=" & oRS(0) & " " & sSelected(sdefault,oRS(0)) & ">" & oRS(1)
	 oRS.movenext
   loop
  end if
  oRS.movefirst ' put it back where you got it
end function

Public Function SelMonthsAbr(sdefault)
 dim a,s,t
  s = "Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec"
  a=split(s)
  for t=0 to ubound(a)
    SelMonthsAbr=SelMonthsAbr & "<option " & sSelected(a(t),sdefault) & ">" & a(t)
  next
End Function

Public Function SelMonthsNum(sdefault)
 dim a,s,t
  s = "1 Jan 2 Feb 3 Mar 4 Apr 5 May 6 Jun 7 Jul 8 Aug 9 Sep 10 Oct 11 Nov 12 Dec"
  a=split(s)
  for t=0 to ubound(a) step 2
    SelMonthsAbr=SelMonthsAbr & "<option " & sSelected(a(t),sdefault) & ">" & a(t+1)
  next
End Function

Public Function SelLastTenYears(sdefault)
 dim a,s,t
  s = "2000 1999 1998 1997 1996 1995 1994 1993 1992 1991"
  a=split(s)
  for t=0 to ubound(a)
    SelLastTenYears=SelLastTenYears & "<option " & sSelected(a(t),sdefault) & ">" & a(t)
  next
End Function

Public Function SelDays(sdefault)
 dim t, s
 for t=1 to 31
  if sdefault<>"" then s = sSelected(cstr(t),cstr(sdefault))
  SelDays = SelDays & "<option " & s & ">" & t
 next
End Function

Public Function SelYears(sStartYear, sEndYear, sdefault)
 dim t, s
 for t=sStartYear to sEndYear
  if sdefault<>"" then s = sSelected(cstr(t),cstr(sdefault))
  SelYears = SelYears & "<option " & s & ">" & t
 next
End Function

Public Function SelStates(sdefault)
  dim t, a, s
  s = "al,Alabama,ak,Alaska,az,Arizona,ar,Arkansas,ca,California,co,Colorado,ct,Connecticut,dc,D.C.,de,Delaware,fl,Florida,ga,Georgia," & _
    "hi,Hawaii,id,Idaho,il,Illinois,in,Indiana,ia,Iowa,ks,Kansas,ky,Kentucky,la,Louisiana,me,Maine,md,Maryland,ma,Massachusetts,mi,Michigan," & _
	"mn,Minnesota,ms,Mississippi,mo,Missouri,mt,Montana,ne,Nebraska,nv,Nevada,nh,New Hampshire,nj,New Jersey,nm,New Mexico,ny,New York," & _
	"nc,North Carolina,nd,North Dakota,oh,Ohio,ok,Oklahoma,or,Oregon,pa,Pennsylvania,ri,Rhode Island,sc,South Carolina,sd,South Dakota," & _
	"tn,Tennessee,tx,Texas,ut,Utah,vt,Vermont,va,Virginia,wa,Washington,wv,West Virginia,wi,Wisconsin,wy,Wyoming"
  a=split(s, ",")
  for t=0 to ubound(a) step 2
    SelStates=SelStates & "<option value='" & a(t) & "' " & sSelected(a(t),sdefault) & ">" & a(t+1)
  next
End Function

Public Function SelAOAs(sdefault)
  dim a,s,t
  s = "North America, Latin America, Africa, Western Europe, Eastern Europe, Russia, Central Asia, South Asia, East Asia, Southeast Asia, South Pacific, " & _
    "Middle East"
  a=split(s, ", ")
  for t=0 to ubound(a)
    SelAOAs=SelAOAs & "<option " & sSelected(a(t),sdefault) & ">" & a(t)
  next
End Function

Public Function SelCountries(sdefault)
  dim a
  s = "AF,Afghanistan,AL,Albania,DZ,Algeria,AS,American Samoa,AD,Andorra,AO,Angola,AI,Anguilla,AQ,Antarctica,AG,Antigua and Barbuda" & _
	",AR,Argentina,AM,Armenia,AW,Aruba,AU,Australia,AT,Austria,AZ,Azerbaijan,BS,Bahamas,BH,Bahrain,BD,Bangladesh,BB,Barbados,BY,Belarus,BE,Belgium" & _
	",BZ,Belize,BJ,Benin,BM,Bermuda,BT,Bhutan,BO,Bolivia,BA,Bosnia and Herzegovina,BW,Botswana,BV,Bouvet Island,BR,Brazil,IO,British Indian Ocean Territory" & _
	",BN,Brunei Darussalam,BG,Bulgaria,BF,Burkina Faso,BI,Burundi,KH,Cambodia,CM,Cameroon,CA,Canada,CV,Cape Verde,KY,Cayman Islands" & _
	",CF,Central African Republic,TD,Chad,CL,Chile,CN,China,CX,Christmas Island,CC,Cocos (Keeling) Islands,CO,Colombia,KM,Comoros,CG,Congo,CK,Cook Islands" & _
	",CR,Costa Rica,CI,Cote D'Ivoire (Ivory Coast),HR,Croatia (Hrvatska),CU,Cuba,CY,Cyprus,CZ,Czech Republic,CS,Czechoslovakia (former),DK,Denmark" & _
	",DJ,Djibouti,DM,Dominica,DO,Dominican Republic,TP,East Timor,EC,Ecuador,EG,Egypt,SV,El Salvador,GQ,Equatorial Guinea,ER,Eritrea,EE,Estonia" & _
	",ET,Ethiopia,FK,Falkland Islands (Malvinas),FO,Faroe Islands,FJ,Fiji,FI,Finland,FR,France,GF,French Guiana,PF,French Polynesia,TF,French Southern Territories" & _
	",GA,Gabon,GM,Gambia,GE,Georgia,DE,Germany,GH,Ghana,GI,Gibraltar,GB,Great Britain (UK),GR,Greece,GL,Greenland,GD,Grenada,GP,Guadeloupe,GU,Guam" & _
	",GT,Guatemala,GN,Guinea,GW,Guinea-Bissau,GY,Guyana,HT,Haiti,HM,Heard and McDonald Islands,HN,Honduras,HK,Hong Kong,HU,Hungary,IS,Iceland,IN,India" & _
	",ID,Indonesia,INT,International,IR,Iran,IQ,Iraq,IE,Ireland,IL,Israel,IT,Italy,JM,Jamaica,JP,Japan,JO,Jordan,KZ,Kazakhstan,KE,Kenya,KI,Kiribati" & _
	",KP,Korea (North),KR,Korea (South),KW,Kuwait,KG,Kyrgyzstan,LA,Laos,LV,Latvia,LB,Lebanon,LS,Lesotho,LR,Liberia,LY,Libya,LI,Liechtenstein,LT,Lithuania" & _
	",LU,Luxembourg,MO,Macau,MK,Macedonia,MG,Madagascar,MW,Malawi,MY,Malaysia,MV,Maldives,ML,Mali,MT,Malta,MH,Marshall Islands,MQ,Martinique" & _
	",MR,Mauritania,MU,Mauritius,YT,Mayotte,MX,Mexico,FM,Micronesia,MD,Moldova,MC,Monaco,MN,Mongolia,MS,Montserrat,MA,Morocco,MZ,Mozambique" & _
	",MM,Myanmar,NA,Namibia,NR,Nauru,NP,Nepal,NL,Netherlands,AN,Netherlands Antilles,NT,Neutral Zone,NC,New Caledonia,NZ,New Zealand (Aotearoa)" & _
	",NI,Nicaragua,NE,Niger,NG,Nigeria,NU,Niue,NF,Norfolk Island,MP,Northern Mariana Islands,NO,Norway,OM,Oman,PK,Pakistan,PW,Palau,PA,Panama" & _
	",PG,Papua New Guinea,PY,Paraguay,PE,Peru,PH,Philippines,PN,Pitcairn,PL,Poland,PT,Portugal,PR,Puerto Rico,QA,Qatar,RE,Reunion,RO,Romania" & _
	",RU,Russian Federation,RW,Rwanda,GS,S. Georgia and S. Sandwich Isls.,KN,Saint Kitts and Nevis,LC,Saint Lucia,VC,Saint Vincent and the Grenadines" & _
	",WS,Samoa,SM,San Marino,ST,Sao Tome and Principe,SA,Saudi Arabia,SN,Senegal,SC,Seychelles,SL,Sierra Leone,SG,Singapore,SK,Slovak Republic,SI,Slovenia" & _
	",Sb,Solomon Islands,SO,Somalia,ZA,South Africa,ES,Spain,LK,Sri Lanka,SH,St. Helena,PM,St. Pierre and Miquelon,SD,Sudan,SR,Suriname,SJ,Svalbard and Jan Mayen Islands" & _
	",SZ,Swaziland,SE,Sweden,CH,Switzerland,SY,Syria,TW,Taiwan,TJ,Tajikistan,TZ,Tanzania,TH,Thailand,TG,Togo,TK,Tokelau,TO,Tonga,TT,Trinidad and Tobago" & _
	",TN,Tunisia,TR,Turkey,TM,Turkmenistan,TC,Turks and Caicos Islands,TV,Tuvalu,UM,US Minor Outlying Islands,SU,USSR (former),UG,Uganda,UA,Ukraine" & _
	",AE,United Arab Emirates,UK,United Kingdom,US,United States,UY,Uruguay,UZ,Uzbekistan,VU,Vanuatu,VA,Vatican City State (Holy See),VE,Venezuela" & _
	",VN,VietNam,VG,Virgin Islands (British),VI,Virgin Islands (U.S.),WF,Wallis and Futuna Islands,EH,Western Sahara,YE,Yemen,YU,Yugoslavia" & _
	",ZR,Zaire,ZM,Zambia,ZW,Zimbabwe"
  a=split(s, ",")
  if isnull(sdefault) then sdefault="US"
  for t=0 to ubound(a) step 2
    SelCountries=SelCountries & "<option value='" & a(t) & "' " & sSelected(a(t),sdefault) & ">" & a(t+1)
  next
End Function
%>