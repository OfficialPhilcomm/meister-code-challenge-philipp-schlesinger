require "test_helper"

class TasksExpirationJobTest < ActiveJob::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "job clears out tasks that are older than 6 months" do
    assert_equal 5, Task.not_expired.count
    TasksExpirationJob.new.perform
    assert_equal 4, Task.not_expired.count
  end
end
