class ResponsesController < ApplicationController
before_action :set_response, only: [:show, :edit, :update, :destroy]

  def index
    @responses = Response.all

    respond_to do |format|
      format.html
      format.csv { send_data @responses.to_csv, filename: "rsvps-#{Date.today}.csv" }
    end
  end

  def show
    @response = Response.find(params[:id])
  end

  def new
    @response = Response.new
  end

  def edit
    @response = Response.find(params[:id])
  end

  def create
    @response = Response.new(response_params)

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: 'Your RSVP has been sent.' }
        format.json { render :show, status: :created }
      else
        format.html { redirect_to @response }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Your RSVP was updated.' }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Your RSVP was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

    def set_response
      @response = Response.find(params[:id])
    end

    def response_params
      params.require(:response).permit(:full_name, :attending, :number_of_attendees, :food_allergies, :song_title, :singer, :comment)
    end

end
