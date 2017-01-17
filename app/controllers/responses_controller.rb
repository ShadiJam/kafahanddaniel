class ResponsesController < ApplicationController
  def index
    @responses = Response.all
  end

  def show
    @response = Response.find(params[:id])
  end

  def new
    @response = Response.new
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

  private
    def response_params
      params.require(:response).permit(:first_name, :last_name, :attending?, :number_of_attendees, :food_allergies, :song_title, :singer, :comment)
    end

end
