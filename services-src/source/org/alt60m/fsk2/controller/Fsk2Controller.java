package org.alt60m.fsk2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.alt60m.fsk2.manager.Fsk2Manager;
import org.alt60m.fsk2.model.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class Fsk2Controller extends MultiActionController {

	private Fsk2Manager fsk2Manager;
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return showIndex(request, response);
	}

	//try with , Object command, Errors errors
	public ModelAndView showIndex(HttpServletRequest request, HttpServletResponse response)
	{
		Product product = fsk2Manager.getProduct(2);
		logger.debug(product);
		return new ModelAndView("defaultIndex");
	}

	public Fsk2Manager getFsk2Manager() {
		return fsk2Manager;
	}

	public void setFsk2Manager(Fsk2Manager fsk2Manager) {
		this.fsk2Manager = fsk2Manager;
	}
	
}
