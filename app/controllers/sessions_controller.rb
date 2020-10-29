class SessionsController < ApplicationController
#SessionsController is used for signing the user in.
include CurrentUserConcern
    # Post request 
    def create
        user = User.find_by(email: params["user"]["email"]).try(:authenticate, params["user"]["password"])

        if user 
            session[:user_id] = user.id
            render json:{
                status: :created,
                logged_in: true,
                user: user
            }
        else 
            render json:{
                #universal http code if the user is not authenticated.
                status: 401
            }
        end 
    end 


    # checks to see if a current user is available
    def logged_in
        if @current_user
            render json:{
                logged_in: true, 
                user: @current_user
            }
        else 
            render json: {
                logged_in: false
            }
        end
    end 

end 