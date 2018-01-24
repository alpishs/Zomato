class RestaurantsController < ApplicationController

  def index
    @restaurant = Restaurant.all
  end

  def store_data_rest
    HTTParty.get("https://api.zomato.com/v1/search.json?city_id=1", :headers => {"X-Zomato-API-Key" => "432a37471b07610663aa58194d0ae363"})["results"].each do |rest|
      @restaurant = Restaurant.new()
      @restaurant.name =rest["result"]["name"]
      @restaurant.cost_for_two =rest["result"]["cost_for_two"]
      @restaurant.address = rest["result"]["address"]
      @restaurant.save
    end
   
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to :root}
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end
end
