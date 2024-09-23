# frozen_string_literal: true

require 'sidekiq-scheduler'

class CleanWorker
  include Sidekiq::Worker

  def perform
    # your code
  end
end
