class SponsoredPostsController < ApplicationController
  def show
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored_post = SponsoredPost.new
  end

  def create
    @sponsored_post = SponsoredPost.new
    @topic = Topic.find(params[:topic_id])
    @sponsored_post.title = params[:title]
    @sponsored_post.body = params[:body]
    @sponsored_post.price = params[:price]
    @sponsored_post.topic = @topic

    if @sponsored_post.save!
      flash[:notice] = 'SponsoredPost was saved.'
      redirect_to [@topic, @sponsored_post]
    else
      flash.now[:alert] = 'There was an error saving the Sponsored Post. Please try again.'
      render :new
    end
  end

  def edit
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def update
    @sponsored_post = SponsoredPost.find(params[:id])
    @sponsored_post.title = params[:post][:title]
    @sponsored_post.body = params[:post][:body]
    @sponsored_post.price = params[:post][:price]

    if @sponsored_post.save
      flash[:notice] = 'SponsoredPost was saved.'
      redirect_to [@sponsored_post.topic, @sponsored_post]
    else
      flash.now[:alert] = 'There was an error saving the Sponsored Post. Please try again.'
      render :new
    end
  end

  def destroy
    @sponsored_post = SponsoredPost.find(params[:id])
    if @sponsored_post.destroy
      flash[:notice] = "'#{@sponsored_post.title}' successfully destroyed"
      redirect_to @sponsored_post.topic
    else
      flash[:alert] = 'There was an error destroying your sponsored post'
      render :show
    end
  end
end
