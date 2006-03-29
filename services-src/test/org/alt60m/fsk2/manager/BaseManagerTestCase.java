package org.alt60m.fsk2.manager;

import org.alt60m.fsk2.model.Product;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.test.AbstractTransactionalSpringContextTests;

import junit.framework.TestCase;

public class BaseManagerTestCase extends AbstractTransactionalSpringContextTests {
    protected final Log log = LogFactory.getLog(getClass());

	protected Fsk2Manager manager;
    
	public BaseManagerTestCase()
	{}
	
	public BaseManagerTestCase(String name) {
		super(name);
	}
	
	protected String[] getConfigLocations() {
        return new String [] {"classpath*:/**/manager/fsk2-dao.xml",
                              "classpath*:/**/controller/fsk2-servlet.xml"};
    }
    
	public void setManager(Fsk2Manager manager) {
		this.manager = manager;
	}
}
