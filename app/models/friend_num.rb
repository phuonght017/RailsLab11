class FriendNum < ApplicationRecord
  validates :num, presence: true
  validates :str_out, presence: true
end
  