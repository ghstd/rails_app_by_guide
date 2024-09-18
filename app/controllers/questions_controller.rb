# frozen_string_literal: true

class QuestionsController < ApplicationController
  include QuestionsAnswers

  before_action :set_question!, only: %i[show edit update destroy]
  before_action :fetch_tags, only: %i[new edit]

  def index
    @pagy, @questions = pagy(Question.includes(:user, :question_tags, :tags).order(created_at: :desc), limit: 5)
    @questions = @questions.decorate
    @tags = Tag.all
  end

  def show
    load_questions_answers
  end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = current_user.questions.build(question_params)
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
    params.require(:question).permit(:title, :body, tag_ids: [])
  end

  def set_question!
    @question = Question.find(params[:id])
  end

  def fetch_tags
    @tags = Tag.all
  end
end
