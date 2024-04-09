class OwnersController < ApplicationController

    before_action :set_owner, only: [:show, :edit, :update]

    def show
    end
    
    def new
        @owner = Owner.new
    end

    def create
        @owner = Owner.new(owner_params)
        member = Member.find_by(first_name: params[:owner][:first_name], last_name: params[:owner][:last_name])
        if member.present? && !member.owner.present?
            @owner.member = member
        end
        if @owner.save
            session[:owner_id] = @owner.id
            flash[:notice] = "Člen #{@owner.first_name} #{@owner.last_name} byl úspěšně registrován"
            redirect_to owner_path(@owner)
        else
            render "new", status: 422
        end
    end

    def edit
    end

    def update
        if @owner.update(owner_params)
            flash[:notice] = "Váš účet byl úspěšně upraven"
            redirect_to owner_path
        else
            render "edit"
        end
    end

    private

    def set_owner
        @owner = Owner.find(params[:id])
    end

    def owner_params
        params.require(:owner).permit(:first_name, :last_name, :email, :password)
    end
end
