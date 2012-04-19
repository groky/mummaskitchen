module AdminHelper
  
  def signin(admin)
    cookies.permanent.signed[:remember_token] = admin.id
    self.current_admin = admin
  end
  
  def signed_in?
    !current_admin.nil?
  end
  
  def is_admin?(customer)
    customer.admin
  end
  
  def current_admin=(admin)
    @current_admin=admin
  end
  
  def current_admin
    @current_admin ||= admin_from_remember_token
  end

  def current_admin?(admin)
    admin==current_admin
  end

  def deny_access
    redirect_to admin_path, :notice => "Please login to access this page."
  end
  
  private 
  
    def admin_from_remember_token
      if remember_token.present? && !remember_token.nil?
        admin = Customer.find(remember_token)
        Customer.authenticate(admin.email, admin.phone)
      end
    end

    def remember_token
      cookies.signed[:remember_token] || [nil]
    end
end
