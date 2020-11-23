class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])
    end

    def create
        @destination = Destination.new(destination_params)
            if @destination.save
                redirect_to @destination
            else
                flash[:errors]= @destination.errors.full_messages
                redirect_to new_student_path
            end
    end

    def edit
        @destination = Destination.find(params[:id])
    end

    def new
        @destination = Destination.new
    end

    def update
        @destination = Destination.find(params[:id])
        if @destination.update(destination_params)
            redirect_to @destination
        else
            flash[:errors]= @destination.errors.full_messages
            redirect_to edit_student_path
    end
end

    def destroy
        @destination = Destination.find(params[:id])
        @destination.destroy
        redirect_to destinations_path
    end

    private
    def destionation_params
        params.require(:destination).permit(:name, :country)
    end

end