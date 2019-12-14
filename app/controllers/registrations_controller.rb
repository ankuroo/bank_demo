# Custom Devise Controller
# This controller is used to extend Devise to allow for more functionality.
class RegistrationsController < Devise::RegistrationsController
    # Declares all actions below as private actions
    private

    # Parameters for registering an account. User has control over name, username, password and email
    def sign_up_params
        params.require(:account).permit(:name, :username, :balance, :account_no, :sort_code, :email, :password, :password_confirmation, :current_password)
    end

    # Parameters for updating account information. User can only change personal info and login info
    def account_update_params
        params.require(:account).permit(:name, :username, :email, :password, :password_confirmation)
    end

end