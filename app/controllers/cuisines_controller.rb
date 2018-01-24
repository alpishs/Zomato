class CuisinesController < ApplicationController

  def index
    @cuisines = Cuisine.all
  end

  def store_data
    HTTParty.get("https://api.zomato.com/v1/cuisines.json?city_id=1", :headers => {"X-Zomato-API-Key" => "432a37471b07610663aa58194d0ae363"})["cuisines"].each do |cuisine|
      @cuisine = Cuisine.new()
      @cuisine.name =cuisine["cuisine"]["cuisine_name"]
      @cuisine.save
    end
   
    respond_to do |format|
      if @cuisine.save
        format.html { redirect_to :root}
      else
        format.html { render :new }
        format.json { render json: @cuisine.errors, status: :unprocessable_entity }
      end
    end
  end

end
