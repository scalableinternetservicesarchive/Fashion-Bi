require 'test_helper'

class OutfitRecsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outfit_rec = outfit_recs(:one)
  end

  test "should get index" do
    get outfit_recs_url
    assert_response :success
  end

  test "should get new" do
    get new_outfit_rec_url
    assert_response :success
  end

  test "should create outfit_rec" do
    assert_difference('OutfitRec.count') do
      post outfit_recs_url, params: { outfit_rec: { clothes_ids: @outfit_rec.clothes_ids, date: @outfit_rec.date, user_id: @outfit_rec.user_id } }
    end

    assert_redirected_to outfit_rec_url(OutfitRec.last)
  end

  test "should show outfit_rec" do
    get outfit_rec_url(@outfit_rec)
    assert_response :success
  end

  test "should get edit" do
    get edit_outfit_rec_url(@outfit_rec)
    assert_response :success
  end

  test "should update outfit_rec" do
    patch outfit_rec_url(@outfit_rec), params: { outfit_rec: { clothes_ids: @outfit_rec.clothes_ids, date: @outfit_rec.date, user_id: @outfit_rec.user_id } }
    assert_redirected_to outfit_rec_url(@outfit_rec)
  end

  test "should destroy outfit_rec" do
    assert_difference('OutfitRec.count', -1) do
      delete outfit_rec_url(@outfit_rec)
    end

    assert_redirected_to outfit_recs_url
  end
end
