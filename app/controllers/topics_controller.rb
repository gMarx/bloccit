class TopicsController < ApplicationController

  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_update, except: [:index, :show, :create, :new, :destroy]
  before_action :authorize_user, except: [:index, :show, :edit, :update]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.create( topic_params )

    if @topic.save
      redirect_to @topic, notice: 'Topic was saved successfully.'
    else
      flash.now[:alert] = 'Error creating topic. Please try again.'
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update_attributes( topic_params )

    if @topic.save
      flash[:notice] = 'Topic was updated successfully.'
      redirect_to @topic
    else
      flash.now[:alert] = 'Error updating topic. Please try again.'
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "'#{@topic.name}' was successfully deleted."
      redirect_to action: :index
    else
      flash.now[:alert] = 'There was an error deleting the topic'
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end

  def authorize_user
    unless current_user.admin?
      flash[:alert] = 'You must be an admin to do that'
      redirect_to topics_path
    end
  end

  def authorize_update
    unless current_user.moderator? || current_user.admin?
      flash[:alert] = 'You must be an admin to do that'
      redirect_to topics_path
    end
  end
end
