class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  
  # def friends
  #   friend_requests_sent = FriendRequest.select{ |request| request.user == self && friend_request_status == "accepted"}
  #   return friend_requests_sen
  # end
  
  
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
