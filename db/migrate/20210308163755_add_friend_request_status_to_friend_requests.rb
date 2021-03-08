class AddFriendRequestStatusToFriendRequests < ActiveRecord::Migration[6.0]
  def change
    add_reference :friend_requests, :friend_request_status, null: false, foreign_key: true
  end
end
