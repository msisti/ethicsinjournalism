require 'test_helper'

class CommentFormsControllerTest < ActionController::TestCase
  setup do
    @comment_form = comment_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_form" do
    assert_difference('CommentForm.count') do
      post :create, comment_form: {  }
    end

    assert_redirected_to comment_form_path(assigns(:comment_form))
  end

  test "should show comment_form" do
    get :show, id: @comment_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_form
    assert_response :success
  end

  test "should update comment_form" do
    patch :update, id: @comment_form, comment_form: {  }
    assert_redirected_to comment_form_path(assigns(:comment_form))
  end

  test "should destroy comment_form" do
    assert_difference('CommentForm.count', -1) do
      delete :destroy, id: @comment_form
    end

    assert_redirected_to comment_forms_path
  end
end
