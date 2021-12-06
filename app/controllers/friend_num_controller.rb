# frozen_string_literal: true

# Base class controller for friend_num
class FriendNumController < ApplicationController
    attr_accessor :res, :num, :db
  
    def home; end;
  
    def sum_divisors(arg)
      sum = 0
      (1...arg).each do |div|
        sum += div if arg % div == 0
      end
      sum
    end
  
    def check
      arr = Array.new(0)
      sum = Array.new(num)
      (1..num).each {|index| sum[index] = sum_divisors(index)}
      (1..num - 1).each do |num1|
        (num1..num).each do |num2|
          arr.append(" #{num1} and #{num2}") if num1 != num2 && num1 == sum[num2] && sum[num1] == num2
        end
      end
      arr
    end
  
    def result
      @num = params[:num].to_i
      if !FriendNum.exists?(num: num)
        str = check.join(';')
        fr_num = FriendNum.new(num: num, str_out: str)
        fr_num.save
      end
      @res = FriendNum.where('num = ?', @num)
    end

    def database
      @db = FriendNum.all
    end
end
