class TasksExpiration < ApplicationJob
  queue_as :default

  def perform(*args)
    Task
      .not_expired
      .where(updated_at: ..6.months.ago)
      .in_batches do |tasks|
        tasks.update!(expired_at: Time.zone.now)
      end
  end
end
