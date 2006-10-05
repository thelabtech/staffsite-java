package org.alt60m.html;

import org.alt60m.util.ArrayHelper;
import java.text.*;
import java.util.*;

public class Menu implements java.io.Serializable {
	String[] _menuNames;
	String[] _menuURLs;
	boolean[] _menuActives;
	String _menuTitle;
	String _headerClass;
	String _class;
	String _activeClass;
	String _inActiveClass;
	String _boxClass;
	String _menuWidth;
	boolean _menuHelp; // Requires [/menus/overLib.jsp]

    public Menu() {
			// Sorting Header Defaults
			_menuNames = new String[]{"menu"};
			_menuURLs = new String[]{"#"};
			_menuActives = new boolean[]{true};
			_menuTitle = "Menu";
			_headerClass = "boxheader";
			_class = "menu";
			_activeClass = "menuactive";
			_inActiveClass = "menuinactive";
			_boxClass = "box";
			_menuWidth = "100%";
			_menuHelp = true;
	}
	
	// Sorting Header Builder
	// Andy Stanberry 3/3/2003
	public void setNames(String[] names) { _menuNames = names; };
	public void setURLs(String[] URLs) { _menuURLs = URLs; };
	public void setActives(boolean[] actives) { _menuActives = actives; };
	public void setTitle(String title) { _menuTitle = title; };
	public void setHeaderClass(String theClass) { _headerClass = theClass; };
	public void setClass(String theClass) { _class = theClass; };
	public void setActiveClass(String theClass) { _activeClass = theClass; };
	public void setInActiveClass(String theClass) { _inActiveClass = theClass; };
	public void setBoxClass(String theClass) { _boxClass = theClass; };
	public void setWidth(String width) { _menuWidth = width; };
	public void setHelp(boolean help) { _menuHelp = help; };

	public String display(int index){
		if(	_menuNames.length == _menuURLs.length){
			StringBuffer menu = new StringBuffer();
			menu.append("<TABLE CLASS='" + _boxClass + "' BORDER='0' CELLSPACING='0' WIDTH='" + _menuWidth + "'>");
			menu.append("<TR>");
			menu.append("<TD ");
			menu.append("CLASS='" + _headerClass + "' ");
			menu.append(">");
			menu.append(_menuTitle);
			menu.append("</TD>");
			menu.append("</TR>");
			for(int i = 0; i < _menuNames.length; i++){
				menu.append("<TR>");
				menu.append("<TD ");
				if(_menuActives.length < _menuNames.length || _menuActives[i]){
					menu.append("CLASS='" + (i == index - 1 ? _activeClass : _class) + "' ");
					menu.append(">");
					if (_menuURLs[i].indexOf("javascript:")==-1) {
						menu.append("<A HREF='" + _menuURLs[i] + "' ");
					} else {
						menu.append("<A HREF=\"" + _menuURLs[i] + "\" ");						
					}
					menu.append("CLASS='" + (i == index - 1 ? _activeClass : _class) + "' ");
					menu.append(">");
					menu.append(_menuNames[i]);
					menu.append("</A>");
				} else {
					menu.append("CLASS='" + _inActiveClass + "' ");
					menu.append(">");
					menu.append(_menuNames[i]);
				}
				menu.append("</TD>");
				menu.append("</TR>");
			}
			menu.append("</TABLE>");
			return menu.toString();
		} else {
			return "Error: Name and URL arrays not equal";
		}
	}

}
