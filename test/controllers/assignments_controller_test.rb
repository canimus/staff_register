require 'test_helper'

class AssignmentsControllerTest < ActionController::TestCase
  setup do
      @assignment = assignments(:finished)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:assignments)
    end

    test "should get new" do
      get :new
      assert_response :success
    end


    test "should show assignment" do
      get :show, id: @assignment
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @assignment
      assert_response :success
    end

    test "should destroy assignment" do
      assert_difference('Assignment.count', -1) do
        delete :destroy, id: @assignment
      end

      assert_redirected_to assignments_path
    end

end
