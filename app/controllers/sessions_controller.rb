class SessionsController < ApplicationController
    def new
    end

    def create
        owner = Owner.find_by(email: params[:session][:email])
        if owner
          if owner.authenticate(params[:session][:password])
            session[:owner_id] = owner.id
            flash[:notice] = "Přihlášení proběhlo úspěšně"
            redirect_to owner_path(owner)
          else
            flash.now[:error] = "Nesprávné heslo"
            render "new"
          end
        else
          flash.now[:error] = "Neplatný email"
          render "new"
        end
      end

    def destroy
        session[:owner_id] = nil
        flash[:notice] = "Odhlášení proběhlo úspěšně"
        redirect_to root_path
    end
end