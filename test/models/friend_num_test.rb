# frozen_string_literal: true

require 'test_helper'

class PalnumTest < ActiveSupport::TestCase
  attr_reader :num, :result, :fr_num

  setup do 
    @num = 3000
    @result = ' 220 and 284; 1184 and 1210; 2620 and 2924'
    @fr_num = FriendNum.new
  end

  test 'should not create without data' do
    assert_not fr_num.save
    fr_num = FriendNum.new(num: @num, str_out: @result)    
    assert fr_num.valid?
    assert fr_num.save
  end
end
