require File.dirname(__FILE__) + '/../test_helper'

class FskUserTest < Test::Unit::TestCase
  fixtures :fsk_users, :simplesecuritymanager_user, :fsk_roles, :fsk_fields, :fsk_fields_roles, :fsk_allocations

  def test_method_missing
    assert fsk_users(:national).emailVerified
  end
  
  def test_can_modify_field
    assert fsk_users(:national).can_modify_field?("impact_allotment")
    assert fsk_users(:national).can_modify_field?("regional_allotment")
    assert fsk_users(:regional).can_modify_field?("regional_allotment")
    assert (not fsk_users(:local).can_modify_field?("impact_allotment"))
  end
  
  def test_relationship
    national_role = Role.find(1);
    assert national_role
    assert fsk_users(:national).role
  end
  
  def test_can_modify_allocation
    josh = fsk_users(:national)
    josh_allocation = Allocation.find(:first, :conditions => ["ssm_id = ?", josh.user.id])
    
    jeff = fsk_users(:regional)
    jeff_allocation = Allocation.find(:first, :conditions => ["ssm_id = ?", jeff.user.id])
    
    joe = fsk_users(:local)
    joe_allocation = Allocation.find(:first, :conditions => ["ssm_id = ?", joe.user.id])
    assert josh.can_modify_allocation?(josh_allocation)
    assert josh.can_modify_allocation?(jeff_allocation)
    assert josh.can_modify_allocation?(joe_allocation)
    
    assert jeff.can_modify_allocation?(jeff_allocation)
    assert jeff.can_modify_allocation?(josh_allocation)
    assert jeff.can_modify_allocation?(joe_allocation)
    
    assert joe.can_modify_allocation?(joe_allocation)
    assert (not joe.can_modify_allocation?(josh_allocation))
    assert (not joe.can_modify_allocation?(jeff_allocation))
    
  end
end
