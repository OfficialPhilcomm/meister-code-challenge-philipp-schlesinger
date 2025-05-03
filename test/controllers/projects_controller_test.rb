require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "update should update the project name" do
    patch project_path(projects(:meistertask)), params: { project: { name: "Make Tatooine Great Again" } }
    assert_response :success
    assert_equal projects(:meistertask).reload.name, "Make Tatooine Great Again"
  end

  test "destroy should set the deleted_at timestamp" do
    assert_nil projects(:mindmeister).deleted_at
    delete project_path(projects(:mindmeister)), headers: { Accept: "text/vnd.turbo-stream.html" }
    assert_response :success
    assert_not_equal projects(:mindmeister).reload.deleted_at, nil
  end
end
