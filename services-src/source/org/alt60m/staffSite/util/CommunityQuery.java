/**
 * 
 */
package org.alt60m.staffSite.util;

import java.io.IOException;
import java.util.Collection;
import java.util.Hashtable;

import org.alt60m.gcx.CommunityAdminInterface;
import org.alt60m.security.dbio.model.User;

/**
 * @author matthew.drees
 *
 * Used to find staff people who for some reason did not have the CampusStaff
 * link in their toolbar, i.e., they were not in the CampusStaff community.
 * This will add them, as well as display some other information.
 * 
 *
 */
public class CommunityQuery {

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
			
			int numGCXUsers = gcxUsers.size();
			
			Collection<String> communityMemberGuids = cai.listUsers();
			
			int numMembers = communityMemberGuids.size();
			
			Hashtable<String, Boolean> allGuids = new Hashtable<String, Boolean>();
						
			
			for (User user : gcxUsers)
			{
				String guid = user.getGloballyUniqueID();
				if (allGuids.put(guid, true) != null) 
				{
					System.out.println("duplicate: "
							+ guid);
				}
				if (!communityMemberGuids.contains(guid))
				{
					System.out.println(user.getUsername() + " (" + guid + ") is not in CampusStaff; adding...");
					if (cai.addToGroup(guid, "MEMBERS"))
					{
						System.out.println("Successful (Code " + cai.getCode() + ")");
						if (!cai.getCode().equals("100"))
						{
							System.out.println(cai.getMessage());
						}
					}
					else
					{
						System.out.println("Failure (Code " + cai.getCode() + ")");
						System.out.println(cai.getError());
					}
				}
			}
			
			for (String memberGuid : communityMemberGuids)
			{
				allGuids.put(memberGuid, true);
				boolean found = false;
				for (User user : gcxUsers)
				{
					if (user.getGloballyUniqueID().equals(memberGuid))
						found = true;
				}
				if (!found)
				{
					System.out.println(memberGuid + " is not in SSM");
				}
			}			

			System.out.println("Number of GCX users in ssm: " + numGCXUsers);
			System.out.println("Number of members in community: " + numMembers);
			System.out.println("Number of unique Guids: " + allGuids.size());
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
