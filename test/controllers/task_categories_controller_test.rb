require 'test_helper'

class TaskCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get Get" do
    get task_categories_Get_url
    assert_response :success
  end

  test "should get Post" do
    get task_categories_Post_url
    assert_response :success
  end

  test "should get Put" do
    get task_categories_Put_url
    assert_response :success
  end

  test "should get Delete" do
    get task_categories_Delete_url
    assert_response :success
  end

end
