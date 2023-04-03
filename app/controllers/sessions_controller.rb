class SessionsController < ApplicationController

def create
    # byebug
    user = User.find_by(username: params[:username])
    if user&.authenticate([:password])
        session[:user_id] = user.id
        byebug
        render json: user, status: :created
    else
        render json: { error: {login: "Invalid username or password"}}, status: :unauthorized
    end
end

end
# def destroy
# end



# Create a Sessions controller with a create action for logging in 
# that responds to a POST /login request, 
# and a destroy action for logging out 
# that responds to a DELETE /logout request.