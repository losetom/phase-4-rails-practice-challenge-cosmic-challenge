class ScientistsController < ApplicationController

    before_action :set_scientist, only: [:show, :update, :destroy]

    # GET /scientists
    def index
        render json: Scientist.all 
    end

    # GET /scientists/:id
    def show
        render json: @scientist, serializer: ScientistWithPlanetsSerializer
    end

    # POST /scientists
    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    # PATCH /scientists/:id
    def update
        @scientist.update!(scientist_params)
        render json: @scientist, status: :accepted
    end

    # DELETE /scientists/:id
    def destroy
        @scientist.destroy
        head :no_content
    end

    private

    def set_scientist 
        @scientist = Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

end