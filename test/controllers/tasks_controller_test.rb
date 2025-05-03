require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "update should update the task name" do
    patch project_task_path(projects(:mindmeister), tasks(:mindmeistertask)), params: { task: { name: "Go grocery shopping at Tosche Station" } }
    assert_response :success
    assert_equal tasks(:mindmeistertask).reload.name, "Go grocery shopping at Tosche Station"
  end

  test "destroy should set the deleted_at timestamp" do
    assert_nil tasks(:mindmeistertask).deleted_at
    delete project_task_path(projects(:mindmeister), tasks(:mindmeistertask))
    assert_response :success
    assert_not_equal tasks(:mindmeistertask).reload.deleted_at, nil
  end
end
