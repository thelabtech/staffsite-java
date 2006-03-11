package org.alt60m.html;

import org.alt60m.util.ArrayHelper;
import java.text.*;
import java.util.*;

public class Formatter implements java.io.Serializable {
	SimpleDateFormat _dateFormat;
	String _noDate;
	
	DecimalFormat _decimalFormat;

	String[] _headerColNames;
	String[] _headerWidths;
	String[] _headerAligns;
	boolean[] _headerSorts;
	boolean _headerHelp; // Requires [/headers/overLib.jsp]
	boolean _headerReport;

	String[] _selectOptionNames;
	String[] _selectOptions;
	String _selectName;
	String _selectClass;
	boolean _selectDisabled;

    public Formatter() {
		try{
			// Date Format defaults
			_dateFormat = new SimpleDateFormat("MM/dd/yyyy");
			_noDate = "No Date";

			// Decimal Format defaults
			_decimalFormat = new DecimalFormat("0.00");

			// Sorting Header Defaults
			_headerColNames = new String[]{"default"};
			_headerWidths = new String[]{"100%"};
			_headerAligns = new String[]{"LEFT"};
			_headerSorts = new boolean[]{false};
			_headerHelp = true;
			_headerHelp = false;

			// Select Defaults
			_selectOptionNames = new String[]{"default"};
			_selectOptions = new String[]{"default"};
			_selectName = "";
			_selectClass = "empty";
			_selectDisabled = false;
		} catch (Exception e) {
			e.printStackTrace();
        }
	}


	// Date Formatting
	// Andy Stanberry 3/3/2003
    public void setDateFormat(String format) { _dateFormat = new SimpleDateFormat(format); }
	public void setNoDate(String text) { _noDate = text; };
	public String formatDate(Date theDate){
		return theDate != null ? _dateFormat.format(theDate) : _noDate;
	}
	
	// Decimal Formatting
	// Andy Stanberry 3/3/2003
    public void setDecimalFormat(String format) { _decimalFormat = new DecimalFormat(format); }
	public String formatDecimal(Float theFloat){
		return formatDecimal(theFloat.floatValue());
	}
	public String formatDecimal(float theFloat){
		return _decimalFormat.format(theFloat);
	}
	public String formatDecimal(Double theDouble){
		return formatDecimal(theDouble.doubleValue());
	}
	public String formatDecimal(double theDouble){
		return _decimalFormat.format(theDouble);
	}
	
	// String Formatting
	// Andy Stanberry 3/3/2003
	public String crToBR(String where){
		if(where != null){
			String what = "\n";
			String with = "<BR>";
			int start_index = where.indexOf(what); 
			while(start_index != -1) { 
				int end_index = start_index + what.length(); 
				String first_segment  = where.substring(0, start_index); 
				String second_segment = where.substring(end_index, where.length()); 

				StringBuffer buf = new StringBuffer(first_segment.length() + second_segment.length() + with.length()); 
				buf.append(first_segment).append(with).append(second_segment); 
				where = buf.toString(); 
				start_index = where.indexOf(what, start_index + 1); 
			}
		}
		return where;
	}
	
	// Sorting Header Builder
	// Andy Stanberry 3/3/2003
	public void setHeaderNames(String[] names) { _headerColNames = names; };
	public void setHeaderAligns(String[] aligns) { _headerAligns = aligns; };
	public void setHeaderWidths(String[] widths) { _headerWidths = widths; };
	public void setHeaderSorts(boolean[] sorts) { _headerSorts = sorts; };
	public void setHeaderWidths(boolean help) { _headerHelp = help; };
	public void setHeaderReport(boolean report) { _headerReport = report; }

	public String displayHeader(String orderColString, String order, String name, String self){
		if(	(_headerColNames.length == _headerWidths.length && _headerColNames.length == _headerAligns.length && _headerWidths.length == _headerAligns.length) || _headerReport == true){
			if(_headerReport){
				_headerWidths = (String[]) java.lang.reflect.Array.newInstance(String.class, _headerColNames.length);
				Arrays.fill(_headerWidths, "");
				_headerAligns = _headerWidths;
				Arrays.fill(_headerAligns, "RIGHT");
				_headerAligns[0] = "LEFT";
				_headerSorts = (boolean[]) java.lang.reflect.Array.newInstance(boolean.class, _headerColNames.length);
				Arrays.fill(_headerSorts, true);
			}

			StringBuffer header = new StringBuffer();
			boolean DESC = order != null && order.equals("DESC");
			int orderCol = Integer.parseInt(orderColString != null ? orderColString : "0");
			orderCol = (orderCol <= _headerColNames.length) ? orderCol : _headerColNames.length;
			header.append("<A NAME='header_" + name + "'>");
			header.append("<TR>");
			for(int i = 0; i < _headerColNames.length; i++){
				header.append("<TD ");
				header.append("CLASS='" + (_headerSorts[i] ? (i == orderCol ? "sortactive" : "sort") : "nosort") + "' ");
				header.append("WIDTH='" + _headerWidths[i] + "' ");
				header.append("ALIGN='" + _headerAligns[i] + "' ");
				if(i == orderCol)
					header.append("NOWRAP");
				header.append(">");
				if(_headerSorts[i]){
					header.append("<A HREF='" + self + "&order=" + (!DESC && i == orderCol ? "DESC" : "ASC") + "&orderCol=" + i + "#header_" + name + "' ");
					header.append("CLASS='" + (i == orderCol ? "sortactive" : "sort") + "' ");
					if(_headerHelp){
						header.append("onmouseover=\"return overlib('");
						header.append("Sort by " + _headerColNames[i] + " " + (!DESC && i == orderCol ? "Descending" : "Ascending"));
						header.append("');\" onmouseout=\"return nd();\" ");
					}
					header.append(">");
					header.append(_headerColNames[i]);
					if(i == orderCol)
						header.append("<IMG SRC='/images/sort" + (DESC ? "DESC" : "ASC") + ".gif' BORDER=0 ALIGN='CENTER'> ");
					header.append("</A>");
				} else {
					header.append(_headerColNames[i].equals("") ? "&nbsp;" : _headerColNames[i]);
				}
				header.append("</TD>");
			}
			header.append("</TR>");
			return header.toString();
		} else {
			return "Error: Column, width and align arrays not equal";
		}
	}

	// SELECT Builder
	// Andy Stanberry 3/3/2003
	public void setSelectOptionNames(String[] names) { _selectOptionNames = names; };
	public void setSelectOptions(String[] options) { _selectOptions = options; };
	public void setSelectName(String name) { _selectName = name; };
	public void setSelectClass(String sclass) { _selectClass = sclass; };
	public void setSelectDisabled(boolean disabled) { _selectDisabled = disabled; };

	public String displaySelect(String current){
		if(	_selectOptionNames.length == _selectOptions.length){
			StringBuffer select = new StringBuffer();
			select.append("<SELECT " + (_selectDisabled ? "DISABLED" : "") + " CLASS='" + _selectClass + "' onFocus='Highlight(this)' onBlur='UnHighlight(this)' NAME='" + _selectName + "'>");
			for(int i = 0; i < _selectOptionNames.length; i++){
				select.append("<OPTION " + ((_selectOptions[i].equals(current)) ? "SELECTED" : "") + " VALUE='" + _selectOptions[i] + "'>");
				select.append(_selectOptionNames[i]);
				select.append("</OPTION>");
			}
			select.append("</SELECT>");
			return select.toString();
		} else {
			return "Error: optionName(" + _selectOptionNames.length + ") and option(" + _selectOptions.length + ") arrays not equal";
		}
	}

	static public String displayArrayName(String current, String[] options, String[] names){
		if(ArrayHelper.indexOf(current,options) >= 0)
			return names[ArrayHelper.indexOf(current,options)];
		else
			return "";
	}

	public String displayPager(String offsetString, String pageSizeString, String maxSizeString, String name, String self){
		StringBuffer pager = new StringBuffer();
		int offset = Integer.parseInt(offsetString != null ? offsetString : "1");
		int pageSize = Integer.parseInt(pageSizeString != null ? pageSizeString : "1");
		int maxSize = Integer.parseInt(maxSizeString != null ? maxSizeString : "1");
		int nextOffset, lastOffset, lastPageEnd, nextSize, lastSize;
		
		offset = (offset <= maxSize) ? offset : maxSize;
		offset = (offset >= 1) ? offset : 1;

		// The start/end page of the next views
		nextOffset = pageSize + offset;

		lastOffset = ((offset - pageSize) > 0) ? (offset - pageSize) : 1;
		lastPageEnd = ((offset - 1) > pageSize) ? (offset - 1) : offset - 1;  // is this right?  doesn't seem like it calculates the last page end


		// How many we'll display in the next view
		
		if(pageSize + (pageSize + offset - 1) < maxSize){
			nextSize = pageSize;
		} else {
			nextSize = maxSize - (pageSize + offset - 1);
		}

		if(lastPageEnd > pageSize){
			lastSize = pageSize;
		} else {
			lastSize = lastPageEnd;
		}


		pager.append("<A NAME='pager_" + name + "'>");
		pager.append("<TABLE BORDER='0' CELLSPACING='0' WIDTH='100%'>");
		pager.append("<TR>");
		pager.append("<TD ");
		pager.append("COLSPAN='2' ");
		pager.append("CLASS='button' ");
		pager.append("WIDTH='50%' ");
		pager.append("ALIGN='LEFT' ");
		pager.append(">");
		pager.append("Displaying <B>" + offset + "</B> - <B>" + (offset + pageSize - 1 > maxSize ? maxSize : offset + pageSize - 1) + "</B> of <B>" + maxSize + "</B> " + name);
		pager.append("</TD>");
		pager.append("<FORM ACTION='" + self + "' METHOD='POST' NAME='" + name + "_sizeForm'>");
		pager.append("<TD ");
		pager.append("COLSPAN='2' ");
		pager.append("CLASS='button' ");
		pager.append("WIDTH='50%' ");
		pager.append("ALIGN='RIGHT' ");
		pager.append(">");
		pager.append("<INPUT TYPE='hidden' NAME='offset' VALUE='" + offset + "'>");
		pager.append("Display <SELECT NAME='size' onChange='document." + name + "_sizeForm.submit()'>");
		pager.append("<OPTION>" + pageSize + "</OPTION>");
		for (int x = 10; x <= 100; x += 10){
			pager.append("<OPTION>" + x + "</OPTION>");
		}
		pager.append("</SELECT>" + name + " per page");
		pager.append("</TD>");
		pager.append("</FORM>");
		pager.append("</TR>");
		pager.append("<TR>");
		pager.append("<TD ");
		pager.append("CLASS='button' ");
		pager.append("WIDTH='40%' ");
		pager.append("ALIGN='LEFT' ");
		pager.append(">");
		if(offset > 1){
			pager.append("<A HREF='" + self + "&offset=" + lastOffset + "&size=" + pageSize + "' ");
			pager.append("CLASS='button' ");
			pager.append(">");
			pager.append("&lt;&lt; Previous " + lastSize + " " + name);
			pager.append("</A>");
		} else
			pager.append("&nbsp;");
		pager.append("</TD>");
		pager.append("<TD ");
		pager.append("CLASS='button' ");
		pager.append("WIDTH='20%' ");
		pager.append("ALIGN='CENTER' ");
		pager.append(">");
		if(offset > 1){
			pager.append("<A HREF='" + self + "&offset=1&size=" + pageSize + "' ");
			pager.append("CLASS='button' ");
			pager.append(">");
			pager.append("First Page");
			pager.append("</A>");
		} else
			pager.append("&nbsp;");
		pager.append("</TD>");
		pager.append("<TD ");
		pager.append("CLASS='button' ");
		pager.append("WIDTH='40%' ");
		pager.append("ALIGN='RIGHT' ");
		pager.append(">");
		if(offset + pageSize <= maxSize){
			pager.append("<A HREF='" + self + "&offset=" + nextOffset + "&size=" + pageSize + "' ");
			pager.append("CLASS='button' ");
			pager.append(">");
			pager.append("Next " + nextSize + " " + name + " &gt;&gt;");
			pager.append("</A>");
		} else
			pager.append("&nbsp;");
		pager.append("</TD>");
		pager.append("</TR>");
		pager.append("</TABLE>");
		return pager.toString();
	}

	public String displayPager(String order, String orderCol, String offsetString, String pageSizeString, String maxSizeString, String name, String self){
		StringBuffer pager = new StringBuffer();
		order = order != null ? order : "ASC";
		orderCol = orderCol != null ? orderCol : "0";
		int offset = Integer.parseInt(offsetString != null ? offsetString : "1");
		int pageSize = Integer.parseInt(pageSizeString != null ? pageSizeString : "1");
		int maxSize = Integer.parseInt(maxSizeString != null ? maxSizeString : "1");
		int nextOffset, lastOffset, lastPageEnd, nextSize, lastSize;
		
		offset = (offset <= maxSize) ? offset : maxSize;
		offset = (offset >= 1) ? offset : 1;

		// The start/end page of the next views
		nextOffset = pageSize + offset;

		lastOffset = ((offset - pageSize) > 0) ? (offset - pageSize) : 1;
		lastPageEnd = ((offset - 1) > pageSize) ? (offset - 1) : offset - 1;


		// How many we'll display in the next view
		
		if(pageSize + (pageSize + offset - 1) < maxSize){
			nextSize = pageSize;
		} else {
			nextSize = maxSize - (pageSize + offset - 1);
		}

		if(lastPageEnd > pageSize){
			lastSize = pageSize;
		} else {
			lastSize = lastPageEnd;
		}


		pager.append("<A NAME='pager_" + name + "'>");
		pager.append("<TABLE BORDER='0' CELLSPACING='0' WIDTH='100%'>");
		pager.append("<TR>");
		pager.append("<TD ");
		pager.append("COLSPAN='2' ");
		pager.append("CLASS='button' ");
		pager.append("WIDTH='50%' ");
		pager.append("ALIGN='LEFT' ");
		pager.append(">");
		pager.append("Displaying <B>" + offset + "</B> - <B>" + (offset + pageSize - 1 > maxSize ? maxSize : offset + pageSize - 1) + "</B> of <B>" + maxSize + "</B> " + name);
		pager.append("</TD>");
		pager.append("<FORM ACTION='" + self + "' METHOD='POST' NAME='" + name + "_sizeForm'>");
		pager.append("<TD ");
		pager.append("COLSPAN='2' ");
		pager.append("CLASS='button' ");
		pager.append("WIDTH='50%' ");
		pager.append("ALIGN='RIGHT' ");
		pager.append(">");
		pager.append("<INPUT TYPE='hidden' NAME='offset' VALUE='" + offset + "'>");
		pager.append("<INPUT TYPE='hidden' NAME='order' VALUE='" + order + "'>");
		pager.append("<INPUT TYPE='hidden' NAME='orderCol' VALUE='" + orderCol + "'>");
		pager.append("Display <SELECT NAME='size' onChange='document." + name + "_sizeForm.submit()'>");
		pager.append("<OPTION>" + pageSize + "</OPTION>");
		for (int x = 10; x <= 100; x += 10){
			pager.append("<OPTION>" + x + "</OPTION>");
		}
		pager.append("</SELECT>" + name + " per page");
		pager.append("</TD>");
		pager.append("</FORM>");
		pager.append("</TR>");
		pager.append("<TR>");
		pager.append("<TD ");
		pager.append("CLASS='button' ");
		pager.append("WIDTH='40%' ");
		pager.append("ALIGN='LEFT' ");
		pager.append(">");
		if(offset > 1){
			pager.append("<A HREF='" + self + "&offset=" + lastOffset + "&size=" + pageSize + "&order=" + order +"&orderCol=" + orderCol +"' ");
			pager.append("CLASS='button' ");
			pager.append(">");
			pager.append("&lt;&lt; Previous " + lastSize + " " + name);
			pager.append("</A>");
		} else
			pager.append("&nbsp;");
		pager.append("</TD>");
		pager.append("<TD ");
		pager.append("CLASS='button' ");
		pager.append("WIDTH='20%' ");
		pager.append("ALIGN='CENTER' ");
		pager.append(">");
		if(offset > 1){
			pager.append("<A HREF='" + self + "&offset=1&size=" + pageSize + "&order=" + order +"&orderCol=" + orderCol +"' ");
			pager.append("CLASS='button' ");
			pager.append(">");
			pager.append("First Page");
			pager.append("</A>");
		} else
			pager.append("&nbsp;");
		pager.append("</TD>");
		pager.append("<TD ");
		pager.append("CLASS='button' ");
		pager.append("WIDTH='40%' ");
		pager.append("ALIGN='RIGHT' ");
		pager.append(">");
		if(offset + pageSize <= maxSize){
			pager.append("<A HREF='" + self + "&offset=" + nextOffset + "&size=" + pageSize + "&order=" + order +"&orderCol=" + orderCol +"' ");
			pager.append("CLASS='button' ");
			pager.append(">");
			pager.append("Next " + nextSize + " " + name + " &gt;&gt;");
			pager.append("</A>");
		} else
			pager.append("&nbsp;");
		pager.append("</TD>");
		pager.append("</TR>");
		pager.append("</TABLE>");
		return pager.toString();
	}

	public String displaySmallPager(String offsetString, String pageSizeString, String maxSizeString, String name, String self){
		StringBuffer pager = new StringBuffer();
		int offset = Integer.parseInt(offsetString != null ? offsetString : "1");
		int pageSize = Integer.parseInt(pageSizeString != null ? pageSizeString : "1");
		int maxSize = Integer.parseInt(maxSizeString != null ? maxSizeString : "1");
		int nextOffset, lastOffset, lastPageEnd, nextSize, lastSize;
		
		offset = (offset <= maxSize) ? offset : maxSize;
		offset = (offset >= 1) ? offset : 1;

		// The start/end page of the next views
		nextOffset = pageSize + offset;

		lastOffset = ((offset - pageSize) > 0) ? (offset - pageSize) : 1;
		lastPageEnd = ((offset - 1) > pageSize) ? (offset - 1) : offset - 1;


		// How many we'll display in the next view
		
		if(pageSize + (pageSize + offset - 1) < maxSize){
			nextSize = pageSize;
		} else {
			nextSize = maxSize - (pageSize + offset - 1);
		}

		if(lastPageEnd > pageSize){
			lastSize = pageSize;
		} else {
			lastSize = lastPageEnd;
		}


		pager.append("<A NAME='pager_" + name + "'>");
		pager.append("<TABLE BORDER='0' CELLSPACING='0' WIDTH='100%'>");
		pager.append("<TR>");
		pager.append("<TD ");
		pager.append("CLASS='button' ");
		pager.append("WIDTH='50%' ");
		pager.append("ALIGN='LEFT' ");
		pager.append(">");
		if(offset > 1){
			pager.append("<A HREF='" + self + "&offset=" + lastOffset + "&size=" + pageSize + "' ");
			pager.append("CLASS='button' ");
			pager.append(">");
			pager.append("&lt;&lt; Last " + lastSize + " " + name);
			pager.append("</A>");
		} else
			pager.append("&nbsp;");
		pager.append("</TD>");
		pager.append("<TD ");
		pager.append("CLASS='button' ");
		pager.append("WIDTH='50%' ");
		pager.append("ALIGN='RIGHT' ");
		pager.append(">");
		if(offset + pageSize <= maxSize){
			pager.append("<A HREF='" + self + "&offset=" + nextOffset + "&size=" + pageSize + "' ");
			pager.append("CLASS='button' ");
			pager.append(">");
			pager.append("Next " + nextSize + " " + name + " &gt;&gt;");
			pager.append("</A>");
		} else
			pager.append("&nbsp;");
		pager.append("</TD>");
		pager.append("</TR>");
		pager.append("</TABLE>");
		return pager.toString();
	}

	public String escapeString(String theString){
		return theString.replaceAll("([\\'|\\\"])","\\\\$1");
	}
}
