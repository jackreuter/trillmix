require 'test_helper'

class VideosongsControllerTest < ActionController::TestCase
  setup do
    @videosong = videosongs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:videosongs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create videosong" do
    assert_difference('Videosong.count') do
      post :create, videosong: { likes: @videosong.likes, song_url: @videosong.song_url, video_url: @videosong.video_url }
    end

    assert_redirected_to videosong_path(assigns(:videosong))
  end

  test "should show videosong" do
    get :show, id: @videosong
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @videosong
    assert_response :success
  end

  test "should update videosong" do
    patch :update, id: @videosong, videosong: { likes: @videosong.likes, song_url: @videosong.song_url, video_url: @videosong.video_url }
    assert_redirected_to videosong_path(assigns(:videosong))
  end

  test "should destroy videosong" do
    assert_difference('Videosong.count', -1) do
      delete :destroy, id: @videosong
    end

    assert_redirected_to videosongs_path
  end
end
