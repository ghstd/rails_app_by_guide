# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def name_or_email
    name.presence || email.split('@')[0]
  end
end
