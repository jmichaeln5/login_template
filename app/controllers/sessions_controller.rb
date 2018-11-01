class SessionsController < ApplicationController

    def new
    end

    def create
      user = User.find_by_email(params[:email])
      # If the user exists AND the password entered is correct.
      if user && user.authenticate(params[:password])
        # Save the user id inside the browser cookie. This is how we keep the user
        # logged in when they navigate around our website.
        session[:user_id] = user.id
        redirect_to current_user, :notice => "Logged in successfully."
      else
        flash[:login_errors] = ['Invalid credentials, please try again.']
        # redirect_to users_index_path
        redirect_to root_path
      end
    end

    def destroy
      session[:user_id] = nil
      cookies.delete(:auth_token)
      redirect_to root_url, :notice => "Logged out successfully."
    end

    private

    def login_params
      params.require(:user).permit(:email, :password)
    end

end
