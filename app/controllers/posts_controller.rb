class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build( params.require(:post).permit(:title, :body) )

    if @post.save
      flash[:notice] = 'Post was saved.'
      redirect_to [@topic, @post]
    else
      flash.now[:alert] = 'There was an error saving the post. Please try again.'
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update

    @post = Post.find(params[:id])

    if @post.update_attributes( params.require(:post).permit(:title, :body) )
      flash[:notice] = 'Post was updated'
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = 'There was an error saving the post. Please try again.'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "'#{@post.title}' was successfully destroyed"
      redirect_to @post.topic
    else
      flash[:alert] = 'There was an error destroying the post. Please try again.'
      render :show
    end
  end
end
