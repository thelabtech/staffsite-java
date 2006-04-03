require File.dirname(__FILE__) + '/../test_helper'

class FskUserTest < Test::Unit::TestCase
  fixtures :fsk_users, :simplesecuritymanager_user

  def test_method_missing
    assert fsk_users(:national).emailVerified
  end
end
