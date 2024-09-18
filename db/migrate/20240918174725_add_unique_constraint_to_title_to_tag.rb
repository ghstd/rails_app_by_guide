# frozen_string_literal: true

class AddUniqueConstraintToTitleToTag < ActiveRecord::Migration[7.1]
  def change
    add_index :tags, :title, unique: true
  end
end
