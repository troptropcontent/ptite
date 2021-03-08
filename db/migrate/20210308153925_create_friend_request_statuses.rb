class CreateFriendRequestStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_request_statuses do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
