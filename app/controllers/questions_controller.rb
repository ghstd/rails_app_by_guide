# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show edit update destroy]

  def index
    @pagy, @questions = pagy(Question.order(created_at: :desc), limit: 5)
    @questions = @questions.decorate
  end

  def show
    @question = @question.decorate
    @answer = @question.answers.build
    @pagy, @answers = pagy(@question.answers.order(created_at: :desc), limit: 3)
    @answers = @answers.decorate
  end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = t('.success')
      redirect_to questions_path
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      flash[:success] = t('.success')
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash[:success] = t('.success')
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find(params[:id])
  end
end
