class SampleJob < ApplicationJob
  queue_as :default

  def perform(name)
    Rails.logger.info "Hello, #{name}! This job was processed by SolidQueue at #{Time.current}"

    # Simulate some work
    sleep 2

    Rails.logger.info "Job completed for #{name}"
  end
end
