class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :friend_requests
  has_many :invitations
  has_many :friends
  has_many :events

  def invitations_sent
    users_requested = []
    friend_request_sent = FriendRequest.where("user_id = ?", self.id)
    friend_request_sent.each do |request|
      users_requested << request.friend.user
    end
    return users_requested
  end
  
  def invitations_received
    users_requesters = []
    friend_request_received = FriendRequest.joins(:friend).where("friends.user_id = ?", self.id)
    friend_request_received.each do |request|
      users_requesters << request.user
    end
    return users_requesters
  end
  # def friends
  #   friend_requests_sent = FriendRequest.select{ |request| request.user == self && friend_request_status == "accepted"}
  #   return friend_requests_sen
  # end

  
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
