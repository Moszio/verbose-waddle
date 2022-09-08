class SweetsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    def index
        sweets = Sweet.all 
        render json: sweets
    end

    def show
        sweet = Sweet.find_by!(id: params[:id])
        render json: sweet
    end


    private

    def render_not_found
        render json: { error: "Sweet not found" }, status: :not_found
    end
end
