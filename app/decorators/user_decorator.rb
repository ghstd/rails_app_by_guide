class UserDecorator < Draper::Decorator
  delegate_all

  def name_or_email
    if name.present?
      name
    else
      email.split('@')[0]
    end
  end

end
