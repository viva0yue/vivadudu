class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.page(params[:page])
    @location_hash = Gmaps4rails.build_markers(@restaurants.where.not(:address_latitude => nil)) do |restaurant, marker|
      marker.lat restaurant.address_latitude
      marker.lng restaurant.address_longitude
      marker.infowindow "<h5><a href='/restaurants/#{restaurant.id}'>#{restaurant.created_at}</a></h5><small>#{restaurant.address_formatted_address}</small>"
    end

    render("restaurants/index.html.erb")
  end

  def show
    @review = Review.new
    @restaurant = Restaurant.find(params[:id])

    render("restaurants/show.html.erb")
  end

  def new
    @restaurant = Restaurant.new

    render("restaurants/new.html.erb")
  end

  def create
    @restaurant = Restaurant.new

    @restaurant.name = params[:name]
    @restaurant.address = params[:address]
    @restaurant.tags = params[:tags]
    @restaurant.cover_photo = params[:cover_photo]
    @restaurant.description = params[:description]
    @restaurant.restaurant_id = params[:restaurant_id]

    save_status = @restaurant.save

    if save_status == true
      redirect_to(:back, :notice => "Restaurant created successfully.")
    else
      render("restaurants/new.html.erb")
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])

    render("restaurants/edit.html.erb")
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    @restaurant.name = params[:name]
    @restaurant.address = params[:address]
    @restaurant.tags = params[:tags]
    @restaurant.cover_photo = params[:cover_photo]
    @restaurant.description = params[:description]
    @restaurant.restaurant_id = params[:restaurant_id]

    save_status = @restaurant.save

    if save_status == true
      redirect_to(:back, :notice => "Restaurant updated successfully.")
    else
      render("restaurants/edit.html.erb")
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    @restaurant.destroy

    if URI(request.referer).path == "/restaurants/#{@restaurant.id}"
      redirect_to("/", :notice => "Restaurant deleted.")
    else
      redirect_to(:back, :notice => "Restaurant deleted.")
    end
  end
end
