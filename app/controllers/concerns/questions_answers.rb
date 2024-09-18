# frozen_string_literal: true

module QuestionsAnswers
  extend ActiveSupport::Concern

  included do
    def load_questions_answers(do_render: false)
      @question = @question.decorate
      @answer ||= @question.answers.build
      @pagy, @answers = pagy(@question.answers.includes(:user).order(created_at: :desc), limit: 3)
      @answers = @answers.decorate
      render 'questions/show' if do_render
    end
  end
end
