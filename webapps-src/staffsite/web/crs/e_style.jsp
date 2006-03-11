<%
//all the colors on the sight
	String color1 = "#336699"; //dark blue
	String color2 = "#D0DDEA"; //light blue
	String color3 = "#CCCC99"; //sawgrass
	String color4 = "#FFFFFF"; //white
	String color5 = "#FF0000"; //red
	String color6 = "#000000"; //black
	String color7 = "#FFFFFF"; //white again
	String color8 = "#DDDDDD"; //grey

//font face
	String fontFace = "Arial";
	String fontFace2 = "TimesNewRoman";

// 4 sets of FG/BG/Border/Font combinations
	
	//blue on white, blue border
	String colorFG = color1;
	String colorBG = color4;
	String colorBorder = color1;
	String fontS = "<FONT FACE=\""+fontFace+"\" SIZE=\"1\" COLOR=\""+colorFG+"\">";
	String fontM = "<FONT FACE=\""+fontFace+"\" SIZE=\"2\" COLOR=\""+colorFG+"\">";
	String fontL = "<FONT FACE=\""+fontFace+"\" SIZE=\"3\" COLOR=\""+colorFG+"\">";
	String fontXL = "<FONT FACE=\""+fontFace+"\" SIZE=\"4\" COLOR=\""+colorFG+"\">";
	String fontXXL = "<FONT FACE=\""+fontFace+"\" SIZE=\"5\" COLOR=\""+colorFG+"\">";
	String font = fontM;

	//light blue on dark blue, dark blue border
	String colorFG1 = color2;
	String colorBG1 = color1;
	String colorBorder1 = color1;
	String font1S = "<FONT FACE=\""+fontFace+"\" SIZE=\"1\" COLOR=\""+colorFG1+"\">";
	String font1M = "<FONT FACE=\""+fontFace+"\" SIZE=\"2\" COLOR=\""+colorFG1+"\">";
	String font1L = "<FONT FACE=\""+fontFace+"\" SIZE=\"3\" COLOR=\""+colorFG1+"\">";
	String font1XL = "<FONT FACE=\""+fontFace+"\" SIZE=\"4\" COLOR=\""+colorFG1+"\">";
	String font1XXL = "<FONT FACE=\""+fontFace+"\" SIZE=\"5\" COLOR=\""+colorFG1+"\">";
	String font1 = font1M;
	
	//dark blue on light blue, dark blue border
	String colorFG2 = color1;
	String colorBG2 = color2;
	String colorBorder2 = color1;
	String font2S = "<FONT FACE=\""+fontFace+"\" SIZE=\"1\" COLOR=\""+colorFG2+"\">";
	String font2M = "<FONT FACE=\""+fontFace+"\" SIZE=\"2\" COLOR=\""+colorFG2+"\">";
	String font2L = "<FONT FACE=\""+fontFace+"\" SIZE=\"3\" COLOR=\""+colorFG2+"\">";
	String font2XL = "<FONT FACE=\""+fontFace+"\" SIZE=\"4\" COLOR=\""+colorFG2+"\">";
	String font2XXL = "<FONT FACE=\""+fontFace+"\" SIZE=\"5\" COLOR=\""+colorFG2+"\">";
	String font2 = font2M;
	
	//dark blue on sawgrass, dark blue border
	String colorFG3 = color1;
	String colorBG3 = color3;
	String colorBorder3 = color1;
	String font3S = "<FONT FACE=\""+fontFace+"\" SIZE=\"1\" COLOR=\""+colorFG3+"\">";
	String font3M = "<FONT FACE=\""+fontFace+"\" SIZE=\"2\" COLOR=\""+colorFG3+"\">";
	String font3L = "<FONT FACE=\""+fontFace+"\" SIZE=\"3\" COLOR=\""+colorFG3+"\">";
	String font3XL = "<FONT FACE=\""+fontFace+"\" SIZE=\"4\" COLOR=\""+colorFG3+"\">";
	String font3XXL = "<FONT FACE=\""+fontFace+"\" SIZE=\"5\" COLOR=\""+colorFG3+"\">";
	String font3 = font3M;

	//White on dark blue, light blue border
	String colorFG4 = color4;
	String colorBG4 = color1;
	String colorBorder4 = color2;
	String font4S = "<FONT FACE=\""+fontFace+"\" SIZE=\"1\" COLOR=\""+colorFG4+"\">";
	String font4M = "<FONT FACE=\""+fontFace+"\" SIZE=\"2\" COLOR=\""+colorFG4+"\">";
	String font4L = "<FONT FACE=\""+fontFace+"\" SIZE=\"3\" COLOR=\""+colorFG4+"\">";
	String font4XL = "<FONT FACE=\""+fontFace+"\" SIZE=\"4\" COLOR=\""+colorFG4+"\">";
	String font4XXL = "<FONT FACE=\""+fontFace+"\" SIZE=\"5\" COLOR=\""+colorFG4+"\">";
	String font4 = font4M;

//misc
	//hilight font
	String colorFGHL = "ff0000";
	String fontHLS = "<FONT FACE=\""+fontFace+"\" SIZE=\"1\" COLOR=\""+colorFGHL+"\">";
	String fontHLM = "<FONT FACE=\""+fontFace+"\" SIZE=\"2\" COLOR=\""+colorFGHL+"\">";
	String fontHLL = "<FONT FACE=\""+fontFace+"\" SIZE=\"3\" COLOR=\""+colorFGHL+"\">";
	String fontHLXL = "<FONT FACE=\""+fontFace+"\" SIZE=\"4\" COLOR=\""+colorFGHL+"\">";
	String fontHLXXL = "<FONT FACE=\""+fontFace+"\" SIZE=\"5\" COLOR=\""+colorFGHL+"\">";
	String fontHL = fontHLM;

	//text font
	String fontTextS = "<FONT FACE=\""+fontFace+"\" SIZE=\"1\" COLOR=\""+color6+"\">";
	String fontTextM = "<FONT FACE=\""+fontFace+"\" SIZE=\"2\" COLOR=\""+color6+"\">";
	String fontTextL = "<FONT FACE=\""+fontFace+"\" SIZE=\"3\" COLOR=\""+color6+"\">";
	String fontTextXL = "<FONT FACE=\""+fontFace+"\" SIZE=\"4\" COLOR=\""+color6+"\">";
	String fontTextXXL = "<FONT FACE=\""+fontFace+"\" SIZE=\"5\" COLOR=\""+color6+"\">";
	String fontText = fontTextM;

	String fontGS = "<FONT FACE=\""+fontFace+"\" SIZE=\"1\" COLOR=\""+color7+"\">";
	String fontGM = "<FONT FACE=\""+fontFace+"\" SIZE=\"2\" COLOR=\""+color7+"\">";
	String fontGL = "<FONT FACE=\""+fontFace+"\" SIZE=\"3\" COLOR=\""+color7+"\">";
	String fontGXL = "<FONT FACE=\""+fontFace+"\" SIZE=\"4\" COLOR=\""+color7+"\">";
	String fontGXXL = "<FONT FACE=\""+fontFace+"\" SIZE=\"5\" COLOR=\""+color7+"\">";
	String fontG = fontGM;


	//old stuff - to be replaced
	String tableLeftB = " ALIGN=\"RIGHT\" VALIGN=\"TOP\" BGCOLOR=\"#336699\"";
	String tableRightB = " ALIGN=\"LEFT\" VALIGN=\"TOP\" BGCOLOR=\"#336699\"";
	String tableCenterB = " ALIGN=\"CENTER\" VALIGN=\"TOP\" BGCOLOR=\"#336699\"";

	String tableCenterW = " ALIGN=\"CENTER\" VALIGN=\"TOP\" BGCOLOR=\"#FFFFFF\"";
	String tableLeftW = " ALIGN=\"RIGHT\" VALIGN=\"TOP\" BGCOLOR=\"#FFFFFF\"";
	String tableRightW = " ALIGN=\"LEFT\" VALIGN=\"TOP\" BGCOLOR=\"#FFFFFF\"";

	String tableLeftWC = " ALIGN=\"RIGHT\" VALIGN=\"CENTER\" BGCOLOR=\"#FFFFFF\"";
	String tableRightWC = " ALIGN=\"LEFTT\" VALIGN=\"CENTER\" BGCOLOR=\"#FFFFFF\"";
	String tableCenterWC = " ALIGN=\"CENTER\" VALIGN=\"CENTER\" BGCOLOR=\"#FFFFFF\"";


	String tableCenterWB = " ALIGN=\"CENTER\" VALIGN=\"BOTTOM\" BGCOLOR=\"#FFFFFF\"";
	String tableLeftWB = " ALIGN=\"RIGHT\" VALIGN=\"BOTTOM\" BGCOLOR=\"#FFFFFF\"";
	String tableRightWB = " ALIGN=\"LEFT\" VALIGN=\"BOTTOM\" BGCOLOR=\"#FFFFFF\"";

	String tableCenterLB = " ALIGN=\"CENTER\" VALIGN=\"BOTTOM\" BGCOLOR=\"#D0DDEA\"";
	String tableLeftLB = " ALIGN=\"RIGHT\" VALIGN=\"BOTTOM\" BGCOLOR=\"#D0DDEA\"";
	String tableRightLB = " ALIGN=\"LEFT\" VALIGN=\"BOTTOM\" BGCOLOR=\"#D0DDEA\"";

	String tableRightL = " ALIGN=\"LEFT\" VALIGN=\"TOP\" BGCOLOR=\"#D0DDEA\"";
	String tableCenterL = " ALIGN=\"CENTER\" VALIGN=\"TOP\" BGCOLOR=\"#D0DDEA\"";
	String tableLeftL = " ALIGN=\"RIGHT\" VALIGN=\"TOP\" BGCOLOR=\"#D0DDEA\"";

	String tableRightLC = " ALIGN=\"LEFT\" VALIGN=\"CENTER\" BGCOLOR=\"#D0DDEA\"";
	String tableCenterLC = " ALIGN=\"CENTER\" VALIGN=\"CENTER\" BGCOLOR=\"#D0DDEA\"";
	String tableLeftLC = " ALIGN=\"RIGHT\" VALIGN=\"CENTER\" BGCOLOR=\"#D0DDEA\"";

	String tableRightR = " ALIGN=\"LEFT\" VALIGN=\"TOP\" BGCOLOR=\"#FF0000\"";
	String tableCenterR = " ALIGN=\"CENTER\" VALIGN=\"TOP\" BGCOLOR=\"#FF0000\"";
	String tableLeftR = " ALIGN=\"RIGHT\" VALIGN=\"TOP\" BGCOLOR=\"#FF0000\"";

	String tableRightBr = " ALIGN=\"LEFT\" VALIGN=\"TOP\" BGCOLOR=\"#CCCC99\"";
	String tableCenterBr = " ALIGN=\"CENTER\" VALIGN=\"TOP\" BGCOLOR=\"#CCCC99\"";
	String tableLeftBr = " ALIGN=\"RIGHT\" VALIGN=\"TOP\" BGCOLOR=\"#CCCC99\"";

	String fontR1 = "<FONT FACE=\""+fontFace+"\" SIZE=\"1\" COLOR=\"#FF0000\">";
	String fontR = "<FONT FACE=\""+fontFace+"\" SIZE=\"2\" COLOR=\"#FF0000\">";
	String fontR3 = "<FONT FACE=\""+fontFace+"\" SIZE=\"3\" COLOR=\"#FF0000\">";
	String fontR4 = "<FONT FACE=\""+fontFace+"\" SIZE=\"4\" COLOR=\"#FF0000\">";
	String fontR5 = "<FONT FACE=\""+fontFace+"\" SIZE=\"5\" COLOR=\"#FF0000\">";
	String fontB1 = "<FONT FACE=\""+fontFace+"\" SIZE=\"1\" COLOR=\"#336699\">";
	String fontB = "<FONT FACE=\""+fontFace+"\" SIZE=\"2\" COLOR=\"#336699\">";
	String fontB3 = "<FONT FACE=\""+fontFace+"\" SIZE=\"3\" COLOR=\"#336699\">";
	String fontB4 = "<FONT FACE=\""+fontFace+"\" SIZE=\"4\" COLOR=\"#336699\">";
	String fontB5 = "<FONT FACE=\""+fontFace+"\" SIZE=\"5\" COLOR=\"#336699\">";
	String fontB6 = "<FONT FACE=\""+fontFace+"\" SIZE=\"6\" COLOR=\"#336699\">";
	String fontW1 = "<FONT FACE=\""+fontFace+"\" SIZE=\"1\" COLOR=\"#FFFFFF\">";
	String fontW = "<FONT FACE=\""+fontFace+"\" SIZE=\"2\" COLOR=\"#FFFFFF\">";
	String fontW3 = "<FONT FACE=\""+fontFace+"\" SIZE=\"3\" COLOR=\"#FFFFFF\">";
	String fontW4 = "<FONT FACE=\""+fontFace+"\" SIZE=\"4\" COLOR=\"#FFFFFF\">";
	String fontW5 = "<FONT FACE=\""+fontFace+"\" SIZE=\"5\" COLOR=\"#FFFFFF\">";
	String fontH = "<FONT FACE=\""+fontFace+"\" SIZE=\"5\" COLOR=\"#FFFFFF\">";
	String fontText1 = "<FONT FACE=\""+fontFace+"\" SIZE=\"1\" COLOR=\"#000000\">";
	String fontText3 = "<FONT FACE=\""+fontFace+"\" SIZE=\"3\" COLOR=\"#000000\">";


	String bgcolorL =" BGCOLOR=\"#D0DDEA\"";
	String bgcolorW =" BGCOLOR=\"#FFFFFF\"";
	String bgcolorB =" BGCOLOR=\"#336699\"";
	String bgcolorR =" BGCOLOR=\"#FF0000\"";
	String bgcolorBr =" BGCOLOR=\"#CCCC99\"";

	String colorL = "#DODDEA";
	String colorW = "#FFFFFF";
	String colorB = "#336699";
	String colorR = "#FF0000";
	String colorBr = "#CCCC99";

	String hr = "<hr color='#336699' size=1>";

	String backgroundColor = "#FFFFFF";
	String bgcolorG = " BGCOLOR='#DDDDDD'";
	String bgcolorLG = " BGCOLOR='#EEEEEE'";
	String fontG1 = "<FONT FACE=\""+fontFace+"\" SIZE=\"1\" COLOR=\"#DDDDDD\">";


%>
