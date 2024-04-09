class DogsController < ApplicationController

    before_action :set_dog, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
        @dog = Dog.new
    end

    def create 
        @dog = Dog.new(dog_params)
        @dog.owner = current_owner
        if @dog.save 
            flash[:notice] = "Údaje psa byly přidány"
            redirect_to owner_path(Owner.find(@dog.owner_id))
        else
            render "new", status: 422
        end
    end

    def edit
    end

    def update
        if @dog.update(dog_params)
            flash[:notice] = "Údaje psa byly úspěšně upraveny"
            redirect_to owner_path(Owner.find(@dog.owner_id))
        else
            render "edit", status: 422
        end
    end

    def destroy
        @dog.destroy
        redirect_to owner_path(Owner.find(@dog.owner_id))
    end

    private
    def set_dog
        @dog = Dog.find(params[:id])
    end

    def dog_params
        params.require(:dog).permit(:dog_name, :date_of_birth)
    end

end