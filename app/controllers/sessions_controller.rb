class SessionsController < ApplicationController
#SessionsController is used for signing the user in.
    # Post request 
    def create
        user = User.find_by(email: params["user"]["email"]).try(:authenticate, params["user"]["password"])

        if user 
            session[:user_id] = user.id
            redner json:{
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

end 