class FriendRequest < ApplicationRecord
  belongs_to :user
  has_one :friend_request_status
  has_one :friend


end
