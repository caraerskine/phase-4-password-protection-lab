class UsersController < ApplicationController

    def create
        user = User.create(user_params)
            if user.valid?
              render json: user, status: :created
            else
              render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end     
    end

    def show
    end 

    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
end

end


# make a create method 
# that responds to a POST /signup request. 
# It should: 
# create a new user;
# save their hashed password in the database; 
# save the user's ID in the session hash; 
# and return the user object in the JSON response.

# Add a show method to your UsersController that responds to a 
# GET /me request. 
# If the user is authenticated, return 
# the user object in the JSON response.