class Friend < ApplicationRecord
  belongs_to :user
  has_one :friend_request
end
