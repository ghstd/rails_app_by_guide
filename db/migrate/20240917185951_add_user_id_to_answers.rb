# frozen_string_literal: true

class AddUserIdToAnswers < ActiveRecord::Migration[7.1]
  def change
    add_reference :answers, :user, null: false, foreign_key: true, default: 1
  end
end
