package org.alt60m.fsk2.controller;

import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.web.servlet.ModelAndView;

public class Fsk2ControllerTestCase extends BaseControllerTestCase {
	public Fsk2ControllerTestCase(String name)
	{
		super(name);
	}
	
	Fsk2Controller c;
    private MockHttpServletRequest request;
    private ModelAndView mv;

	
	protected void setUp() throws Exception {
		// needed to initialize a user
		super.setUp();
		c = (Fsk2Controller) ctx.getBean("/*");
	}
	
    protected void tearDown() {
        c = null;
    }

	   
	public void testShowIndex() throws Exception
	{
        log.debug("testing showIndex...");
        request = newGet("/showIndex.html");

        mv = c.handleRequest(request, new MockHttpServletResponse());

        assertEquals("defaultIndex", mv.getViewName());
	}
}
