class Customer::SummaryController < ApplicationController
  
  def index
    if get_user.role.name == "national"
      return national_summary
    end
    if get_user.role.name == "regional"
      return regional_summary
    end
    if get_user.role.name == "local"
      return local_summary
    end
    #error
  end
  
  def national_summary
    #assert get_user.role.name == "national"
    
  end
  
  def regional_summary
    #assert get_user.role.name == "regional"
    
  end
  
  def local_summary
    #assert get_user_role == "regional"
    
  end
  
  
  
end
