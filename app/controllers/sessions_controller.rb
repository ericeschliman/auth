class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by({"email" => params["email"]})
        if @user
            if BCrypt::Password.new(@user["password"]) == params["password"]
                session["user_id"] = @user["id"]
                flash["notice"] = "You logged in!"
                redirect_to "/companies"
            else
                flash["notice"] = "Nope!"
                redirect_to "/sessions/new"
            end
        else            
            flash["notice"] = "Nope!"
            redirect_to "/sessions/new"
        end
    end
end
