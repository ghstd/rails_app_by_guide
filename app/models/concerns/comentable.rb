# frozen_string_literal: true

module Comentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :comentable, dependent: :destroy
  end
end
