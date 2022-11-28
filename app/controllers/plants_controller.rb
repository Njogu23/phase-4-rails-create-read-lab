class PlantsController < ApplicationController

    def index
        render json: Plant.all, except: [:created_at, :updated_at]
    end

    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant, except: [:created_at, :updated_at]
        else
            render json: {error: "plant not found"}, status: :not_found
        end
    end

    def create 
        render json: Plant.create(plant_params), status: :created
    end


    private

    def plant_params
        params.permit(:name, :image, :price)
    end
end
