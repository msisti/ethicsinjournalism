require 'test_helper'

class CommentAnswersControllerTest < ActionController::TestCase
  setup do
    @comment_answer = comment_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_answer" do
    assert_difference('CommentAnswer.count') do
      post :create, comment_answer: { content: @comment_answer.content }
    end

    assert_redirected_to comment_answer_path(assigns(:comment_answer))
  end

  test "should show comment_answer" do
    get :show, id: @comment_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_answer
    assert_response :success
  end

  test "should update comment_answer" do
    patch :update, id: @comment_answer, comment_answer: { content: @comment_answer.content }
    assert_redirected_to comment_answer_path(assigns(:comment_answer))
  end

  test "should destroy comment_answer" do
    assert_difference('CommentAnswer.count', -1) do
      delete :destroy, id: @comment_answer
    end

    assert_redirected_to comment_answers_path
  end
end
