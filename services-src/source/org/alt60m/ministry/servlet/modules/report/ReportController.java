
package org.alt60m.ministry.servlet.modules.report;

import org.alt60m.servlet.ActionResults;
import org.alt60m.servlet.Controller.ActionContext;

public class ReportController extends org.alt60m.ministry.servlet.modules.InfoBaseModuleController {

    /**
	 *
	 */
	private static final long serialVersionUID = 1L;

	

    public ReportController() {
        log.debug("ReportController constructor");
    }
    private final String module="report";
	private final String title="Reports";
    public void init() {
        log.debug("ReportController.init()");
        try {
            initState();
        } catch (Exception e) {
            log.fatal("Failed to init!", e);
        }
    }
    /** @param ctx ActionContext object Request parameters: <none> */
    public void index(ActionContext ctx) {
        try {
        	ActionResults result=new ActionResults("IB index");
    		result.putValue("personID",getUsersPersonId(ctx));
    		result.putValue("module",this.module);
    		result.putValue("title",this.title);
    		ctx.setReturnValue(result);
    		
        	ctx.goToView("index");
        }
        catch (Exception e) {
            ctx.goToErrorView();
            log.error("Failed to perform showIndex().", e);
        }
    }
}