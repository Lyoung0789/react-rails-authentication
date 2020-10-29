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
            #this does not return a http status because this is a get request not a post. 
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

    #logs us out of the api
    def logout
        reset_session 
        render json: {
            status: 200, 
            logged_out: true
        }
    end 

end 