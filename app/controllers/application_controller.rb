class ApplicationController < ActionController::Base

    # rails uses a csrf token that is generated by rails and our secret key value and checks to make sure that its the real user.
    # we do not need this since this is just an api
    skip_before_action :verify_authenticity_token
end
