require "test_helper"

class FriendNumControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  attr_reader :num, :num2, :result
  
  def get_res(num)
    post friend_num_url, params: {num:num}
    assigns[:res][0].str_out
  end

  setup do 
    @num = 3000
    @num2 = 8000
    @result = ' 220 and 284; 1184 and 1210; 2620 and 2924'
  end

  test 'should get home' do
    get root_url
    assert_response :success
  end

  test 'should post to result' do
    post friend_num_url
    assert_response :success
  end

  test 'should get result' do
    post friend_num_url, params: {num:@num}
    assert_response :success
    assert_equal assigns[:res][0].str_out, @result
    assert_equal FriendNum.where('num = ?', @num)[0].str_out, @result
  end

  test 'diff response' do
    assert_not_equal get_res(num), get_res(num2)
  end
end
