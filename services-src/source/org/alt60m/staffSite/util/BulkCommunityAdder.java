/**
 * One time script written during conversion to SSO logins.  During testing,
 * we didn't automatically add people to CampusStaff.  This was written
 * to add those (100 or so) people.
 * 
 */
package org.alt60m.staffSite.util;

import org.alt60m.security.dbio.model.User;
import java.util.Collection;
import java.io.IOException;
import org.alt60m.gcx.CommunityAdminInterface;
/**
 * @author matthew.drees
 *
 */
public class BulkCommunityAdder {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		try
		{
			CommunityAdminInterface cai = new CommunityAdminInterface(
					"CampusStaff");

			User userobject = new User();
			
			Collection<User> gcxUsers = userobject.selectList("globallyUniqueID IS NOT NULL");
			
			int numSuccessful = 0;
			for (User user :  gcxUsers)
			{
				if (cai.addToGroup(user.getGloballyUniqueID(), "MEMBERS"))
					numSuccessful++;
				else
					System.out.println(cai.getError());
			}
			System.out.println("Number of Successful adds: " + numSuccessful);
		}
		catch(IOException e)
		{
			System.out.println("IO Exception; Stack trace:");
			e.printStackTrace(System.out);
		}
		catch (Exception e)
		{
			System.out.println("Exception; Stack trace:");
			e.printStackTrace(System.out);
		}
	}

}
