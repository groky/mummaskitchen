module AdminHelper
  
  def signin(admin)
    cookies.permanent.signed[:remember_token] = admin.id
    self.current_user = admin
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def is_admin?(customer)
    customer.admin
  end
  
  def current_user=(user)
    @current_user=user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end

  def current_user?(user)
    user==current_user
  end

  def deny_access
    redirect_to :controller=>:admin, :action=>:login, :notice => "Please login to access this page."
  end
  
  def logout
    kill
  end
  
  private 
  
    def user_from_remember_token
      if remember_token.present? && !remember_token.nil?
        user = Customer.find(remember_token)
        Customer.authenticate(user.email, user.phone)
      end
    end

    def remember_token
      cookies.signed[:remember_token].nil? ? nil : cookies.signed[:remember_token]
    end
    
    def kill
      cookies[:remember_token] = nil
    end
end
