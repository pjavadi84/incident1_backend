class IncidentsController < ApplicationController

    def index
        # binding.pry
        @incidents = FetchIncidentsService.call
        render json: @incidents
    end
    
    # def show
    #     @incident = Incident.find(params[:id])
    # end
end
