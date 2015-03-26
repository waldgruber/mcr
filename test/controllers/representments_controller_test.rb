require 'test_helper'

class RepresentmentsControllerTest < ActionController::TestCase
  setup do
    @representment = representments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:representments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create representment" do
    assert_difference('Representment.count') do
      post :create, representment: { collection_id: @representment.collection_id, question_id: @representment.question_id, rate: @representment.rate, user_id: @representment.user_id }
    end

    assert_redirected_to representment_path(assigns(:representment))
  end

  test "should show representment" do
    get :show, id: @representment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @representment
    assert_response :success
  end

  test "should update representment" do
    patch :update, id: @representment, representment: { collection_id: @representment.collection_id, question_id: @representment.question_id, rate: @representment.rate, user_id: @representment.user_id }
    assert_redirected_to representment_path(assigns(:representment))
  end

  test "should destroy representment" do
    assert_difference('Representment.count', -1) do
      delete :destroy, id: @representment
    end

    assert_redirected_to representments_path
  end
end
