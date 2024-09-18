# frozen_string_literal: true

class QuestionDecorator < Draper::Decorator
  delegate_all
  decorates_association :user

  def formatted_date
    l(created_at.strftime, format: :long)
  end
end
