class RegistrationsController < Devise::RegistrationsController

    private

    def sign_up_params
        params.require(:account).permit(:name, :username, :balance, :account_no, :sort_code, :email, :password, :password_confirmation, :current_password)
    end

    def account_update_params
        params.require(:account).permit(:name, :username, :email, :password, :password_confirmation)
    end

end