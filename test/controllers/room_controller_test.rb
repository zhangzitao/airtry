require 'test_helper'

class RoomControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get room_index_url
    assert_response :success
  end

  test "should get new" do
    get room_new_url
    assert_response :success
  end

  test "should get create" do
    get room_create_url
    assert_response :success
  end

  test "should get listing" do
    get room_listing_url
    assert_response :success
  end

  test "should get pricing" do
    get room_pricing_url
    assert_response :success
  end

  test "should get description" do
    get room_description_url
    assert_response :success
  end

  test "should get photo_upload" do
    get room_photo_upload_url
    assert_response :success
  end

  test "should get amenities" do
    get room_amenities_url
    assert_response :success
  end

  test "should get location" do
    get room_location_url
    assert_response :success
  end

  test "should get update" do
    get room_update_url
    assert_response :success
  end

end
