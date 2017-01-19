class BikesController < ApplicationController

  def index
    # Generate a n+1 query on purpose
    emails_with_bikes = []
    Bike.all.each do |bike|
      emails_with_bikes << bike.user.email if bike.user
    end
    render
  end

  def count
    bikes = Bike.count
    render :index
  end

end
