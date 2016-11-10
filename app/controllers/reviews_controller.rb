class ReviewsController < ApplicationController
  def index
    @reviews = Review.page(params[:page])

    render("reviews/index.html.erb")
  end

  def show
    @review = Review.find(params[:id])

    render("reviews/show.html.erb")
  end

  def new
    @review = Review.new

    render("reviews/new.html.erb")
  end

  def create
    @review = Review.new

    @review.user_id = params[:user_id]
    @review.star = params[:star]
    @review.content = params[:content]
    @review.photo = params[:photo]
    @review.restaurant_id = params[:restaurant_id]

    save_status = @review.save

    if save_status == true
      redirect_to(:back, :notice => "Review created successfully.")
    else
      render("reviews/new.html.erb")
    end
  end

  def edit
    @review = Review.find(params[:id])

    render("reviews/edit.html.erb")
  end

  def update
    @review = Review.find(params[:id])

    @review.user_id = params[:user_id]
    @review.star = params[:star]
    @review.content = params[:content]
    @review.photo = params[:photo]
    @review.restaurant_id = params[:restaurant_id]

    save_status = @review.save

    if save_status == true
      redirect_to(:back, :notice => "Review updated successfully.")
    else
      render("reviews/edit.html.erb")
    end
  end

  def destroy
    @review = Review.find(params[:id])

    @review.destroy

    if URI(request.referer).path == "/reviews/#{@review.id}"
      redirect_to("/", :notice => "Review deleted.")
    else
      redirect_to(:back, :notice => "Review deleted.")
    end
  end
end
