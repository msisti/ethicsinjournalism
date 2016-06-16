require 'test_helper'

class CommentPromptsControllerTest < ActionController::TestCase
  setup do
    @comment_prompt = comment_prompts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_prompts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_prompt" do
    assert_difference('CommentPrompt.count') do
      post :create, comment_prompt: {  }
    end

    assert_redirected_to comment_prompt_path(assigns(:comment_prompt))
  end

  test "should show comment_prompt" do
    get :show, id: @comment_prompt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_prompt
    assert_response :success
  end

  test "should update comment_prompt" do
    patch :update, id: @comment_prompt, comment_prompt: {  }
    assert_redirected_to comment_prompt_path(assigns(:comment_prompt))
  end

  test "should destroy comment_prompt" do
    assert_difference('CommentPrompt.count', -1) do
      delete :destroy, id: @comment_prompt
    end

    assert_redirected_to comment_prompts_path
  end
end
