class HerdingsController < ApplicationController

    before_action :set_herding, only: [:edit, :update, :destroy]

    def index
        @top_10_dogs_dictionary = TopDogs.new(Herding.all.group_by(&:dog_id)).return_top_ten
    end

    def new
        @herding = Herding.new
        @dog_id = params[:dog_id]
    end

    def create
        @herding = Herding.new(herding_params)
        if @herding.save 
            flash[:notice] = "Záznam byl úspěšně přidán"
            redirect_to dog_path(params[:herding][:dog_id])
        else
            @dog_id = params[:herding][:dog_id]
            render "new", status: 422
        end
    end

    def edit
        @dog_id = @herding.dog_id
    end

    def update
        if @herding.update(herding_params)
            flash[:notice] = "Záznam byl úspěšně upraven"
            redirect_to dog_path(params[:herding][:dog_id])
        else 
            @dog_id = @herding.dog_id
            render "edit", status: 422
        end
    end

    def destroy
        dog_id = @herding.dog_id
        @herding.destroy
        redirect_to dog_path(dog_id)
    end

    private

    def set_herding
        @herding = Herding.find(params[:id])
    end
    def herding_params
        params.require(:herding).permit(:category, :event_place, :event_date, :points, :position, :dog_id, :num_dogs)
    end
end





