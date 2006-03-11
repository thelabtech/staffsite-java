package  org.alt60m.html;

public class QuestionHelper implements java.io.Serializable
{
	private String fontB = "<FONT FACE=\"Arial\" SIZE=\"2\" COLOR=\"#336699\">";
	private String fontB1 = "<FONT FACE=\"Arial\" SIZE=\"1\" COLOR=\"#336699\">";

	private String bgcolorG = " BGCOLOR='#DDDDDD'";

	private String tableRightL = " ALIGN=\"LEFT\" VALIGN=\"TOP\" BGCOLOR=\"#D0DDEA\"";
	private String tableRightW = " ALIGN=\"LEFT\" VALIGN=\"TOP\" BGCOLOR=\"#FFFFFF\"";
	private String tableCenterW = " ALIGN=\"CENTER\" VALIGN=\"TOP\" BGCOLOR=\"#FFFFFF\"";

	private String tableRightLC = " ALIGN=\"LEFT\" VALIGN=\"CENTER\" BGCOLOR=\"#D0DDEA\"";
	private String tableCenterLC = " ALIGN=\"CENTER\" VALIGN=\"CENTER\" BGCOLOR=\"#D0DDEA\"";
	private String tableLeftLC = " ALIGN=\"RIGHT\" VALIGN=\"CENTER\" BGCOLOR=\"#D0DDEA\"";

	private String tableLeftWC = " ALIGN=\"RIGHT\" VALIGN=\"CENTER\" BGCOLOR=\"#FFFFFF\"";
	private String tableRightWC = " ALIGN=\"LEFTT\" VALIGN=\"CENTER\" BGCOLOR=\"#FFFFFF\"";
	private String tableCenterWC = " ALIGN=\"CENTER\" VALIGN=\"CENTER\" BGCOLOR=\"#FFFFFF\"";

	private String rName = "";


	public QuestionHelper(String _rName)
	{	
		rName = _rName;
	}

	public String print360Q(String _question, String _answer, String _name) 
	{
		StringBuffer sb = new StringBuffer();

		sb.append("<TR>");
		sb.append("<TD" + bgcolorG + " COLSPAN='4'>");
		sb.append(fontB + _question);
		sb.append("</FONT>");
		sb.append("</TD>");
		sb.append("</TR>");
		sb.append("<TR>");
		sb.append("<TD" + bgcolorG + " COLSPAN='4' ALIGN='CENTER'>");
		sb.append("<TEXTAREA NAME='" + _name + "' ROWS='5' COLS='50' WRAP='VIRTUAL'  onKeyUp='validate(this)'>" + _answer + "</TEXTAREA>");
		sb.append("</FONT>");
		sb.append("</TD>");
		sb.append("</TR>");
		return sb.toString();	
	}

	public String print360Q(String _question, String _answer) 
	{
		StringBuffer sb = new StringBuffer();

		sb.append("<TR>");
		sb.append("<TD" + tableRightL + " COLSPAN='3'>");
		sb.append("<BLOCKQUOTE>");
		sb.append(fontB + _question);
		sb.append("</FONT>");
		sb.append("</TD>");
		sb.append("</TR>");
		sb.append("<TR>");
		sb.append("<TD" + tableRightW + " COLSPAN='3'>");
		sb.append("<BLOCKQUOTE>");
		sb.append(_answer);
		sb.append("</BLOCKQUOTE>");
		sb.append("</FONT>");
		sb.append("</TD>");
		sb.append("</TR>");
		return sb.toString();	
	}

	public String print360R(String _ql, String _qr, String _qb, String _name, int _answer)
	{
		StringBuffer sb = new StringBuffer();
		sb.append("<TR>");
		sb.append("<TD" + bgcolorG + " COLSPAN='3' ALIGN='CENTER'>");
		sb.append("<TABLE WIDTH='90%' CELLPADDING='3' CELLSPACING='2' BORDER='0'>");
		sb.append("<TR>");
		sb.append("<TD " + bgcolorG + " COLSPAN='4'>");
		sb.append(fontB + "Please rate " + rName + " on the following scale:");
		sb.append("</FONT>");
		sb.append("</TD>");
		sb.append("</TR>");
		sb.append("<TR>");
		sb.append("<TD ROWSPAN='2' WIDTH='25%' " + bgcolorG + " ALIGN='RIGHT' VALIGN='TOP'>");
		sb.append(fontB1 + _ql);
		sb.append("</FONT>");
		sb.append("</TD>");
		sb.append("<TD WIDTH='50%' " + tableCenterW + ">");
		sb.append("<TABLE BORDER='0' CELLPADDING='0' CELLSPACING='0' WIDTH='100%'>");
		sb.append("<TR>");
		for(int count = 0; count <= 10; count++){
			sb.append("<TD " + tableCenterW + "><INPUT TYPE='radio' NAME='" + _name + "' VALUE='" + count + "' " + (_answer == count ? "CHECKED":"") + "></TD>");
		}
		sb.append("</TR>");
		sb.append("<TR>");
		sb.append("<TD " + tableCenterW + ">" + fontB1 + "n/a" + "</FONT></TD>");
		for(int count = 1; count <= 10; count++){
			sb.append("<TD " + tableCenterW + ">" + fontB1 + count + "</FONT></TD>");
		}
		sb.append("</TR>");
		sb.append("</TABLE>");
		sb.append("</FONT>");
		sb.append("</TD>");
		sb.append("<TD ROWSPAN='2' WIDTH='25%'" + bgcolorG + " ALIGN='LEFT' VALIGN='TOP'>");
		sb.append(fontB1 + _qr + "</FONT>");
		sb.append("</TD>");
		sb.append("</TR>");
		sb.append("<TR>");
		sb.append("<TD " + bgcolorG + " ALIGN='CENTER' VALIGN='TOP'>" + fontB1 + _qb + "</font></TD>");
		sb.append("</TR>");
		sb.append("</TABLE>");
		sb.append("</TD>");
		sb.append("</TR>");
		return sb.toString();
	}
}


