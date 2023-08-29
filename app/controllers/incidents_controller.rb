class IncidentsController < ApplicationController

    def index
        # binding.pry
        @incidents = FetchIncidentsService.call
        render json: @incidents
        # binding.pry
    end
    
    # def show
    #     @incident = Incident.find(params[:id])
    # end
end
