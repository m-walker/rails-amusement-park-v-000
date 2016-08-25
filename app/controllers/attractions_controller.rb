class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit]

  def index
    @attractions = Attraction.all
  end

  def show
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.create(attraction_params)
    return redirect_to new_attraction_path unless attraction.save
    @attraction = attraction
    redirect_to attraction_path(@attraction)
  end

  def edit
  end

  def update
    @attraction = Attraction.find(params[:id])
    return redirect_to edit_attraction_path(@attraction) unless @attraction.valid?
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
