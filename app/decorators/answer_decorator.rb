# frozen_string_literal: true

class AnswerDecorator < Draper::Decorator
  delegate_all
  decorates_association :user

  def formatted_date
    l(created_at.strftime, format: :long)
  end
end
