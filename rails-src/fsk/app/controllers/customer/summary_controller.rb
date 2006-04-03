class Customer::SummaryController < ApplicationController
  
  def index
    if get_user_role == "national"
      return national_summary
    end
    if get_user_role == "regional"
      return regional_summary
    end
    if get_user_role == "local"
      return local_summary
    end
    #error
  end
  
  def national_summary
    #assert get_user_role == "national"
    
  end
  
  def regional_summary
    #assert get_user_role == "regional"
    
  end
  
  def local_summary
    #assert get_user_role == "regional"
    
  end
  
  
  
end
