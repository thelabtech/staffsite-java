package org.alt60m.fsk2.manager;


import org.alt60m.fsk2.model.Product;

/**
 * Base class for running DAO tests.
 * @author mraible
 */
public class Fsk2ManagerTestCase extends BaseManagerTestCase
{
	public Fsk2ManagerTestCase(String name) {
		super(name);
	}
	
	public void testFindProduct() throws Exception
	{
    	//assumes existing product with id = 1;
    	Product existing = manager.getProduct(2);
    	assertNotNull(existing);
    	assertNotNull(existing.getName());
	}
	
	
    public void testSaveProduct() throws Exception
    {
    	Product p = new Product();
    	p.setName("Mountain Dew");
    	p.setDescription("Sweet nutrients");
    	p.setQuantity(12);
    	p.setKitCategory_id(1);
    	p.persist();
    	int id = p.getId();
    	
    	Product check = manager.getProduct(id);
    	assertEquals(check.getName(), p.getName());
    }
}
