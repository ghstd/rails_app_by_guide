# frozen_string_literal: true

class AnswersController < ApplicationController
  include QuestionsAnswers

  before_action :set_question!
  before_action :set_answer!, except: :create
  def edit; end

  def create
    @answer = @question.answers.build(answer_params_create)

    if @answer.save
      flash[:success] = 'Answer created!'
      redirect_to question_path(@question, anchor: "answer-#{@answer.id}")
    else
      load_questions_answers(do_render: true)
    end
  end

  def update
    if @answer.update(answer_params_update)
      flash[:success] = 'Answer updated'
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    flash[:success] = 'Answer deleted'
    redirect_to question_path(@question)
  end

  private

  def set_answer!
    @answer = @question.answers.find(params[:id])
  end

  def set_question!
    @question = Question.find(params[:question_id])
  end

  def answer_params_create
    params.require(:answer).permit(:body).merge(user_id: current_user.id)
  end

  def answer_params_update
    params.require(:answer).permit(:body)
  end
end
