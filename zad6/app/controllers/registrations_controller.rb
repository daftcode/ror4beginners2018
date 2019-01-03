class RegistrationsController < Devise::RegistrationsController 

  def index
    @customers = Customer.all

    # How can I map it automaticly to this location? Which folder should I choose or what I did wrong way
    render "devise/customers/index"  
  end

private

  def sign_up_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

end