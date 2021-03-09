class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend_request_status
  belongs_to :friend
end
