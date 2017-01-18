class ResponsesController < ApplicationController
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

    if @response.save
      redirect_to @response
    else
      render 'new'
    end
  end

  def update
    @response = Response.find(params[:id])

    if @response.update(response_params)
      redirect_to @response
    else
      render 'edit'
    end
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy

    redirect_to responses_path
  end

  private
    def response_params
      params.require(:response).permit(:full_name, :attending, :number_of_attendees, :food_allergies, :song_title, :singer, :comment)
    end

end
