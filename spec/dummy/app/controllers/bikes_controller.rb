class BikesController < ApplicationController

  def index
    # Generate a n+1 query on purpose
    emails_with_bikes = []
    Bike.all.each do |bike|
      emails_with_bikes << bike.user.email if bike.user
    end
    respond_to do |format|
      format.html { render }
      format.json { render json: {data: "bikes and stuff"} }
    end
  end

  def count
    bikes = Bike.count
    render :index
  end

  def no_layout
    render :index, layout: false
  end

end
