class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create( question_params )

    if @question.save
      flash[:notice] = 'Your Question has been saved.'
      redirect_to @question
    else
      flash.now[:alert] = 'There was a problem saving your question. Please ask again.'
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes( question_params )

    if @question.save
      flash[:notice] = 'Question was updated'
      redirect_to @question
    else
      flash.now[:alert] = 'There was an error updating your question. Please try again.'
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])

    if @question.destroy
      flash[:notice] = "'#{@question.title}' has been removed."
      redirect_to questions_path
    else
      flash.now[:alert] = 'We had trouble deleting your question. Please try again.'
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :resolved)
  end
end
