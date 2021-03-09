# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

friend_request_status = %w(sent accepted rejected blocked)
friend_request_status.each do |status|
  new_status = FriendRequestStatus.new(name: status)
  new_status.save!
end

invitation_status = %w(sent accepted rejected may_be)
invitation_status.each do |status|
  new_status = InvitationStatus.new(name: status)
  new_status.save!
end

privacy = %w(public private)
privacy.each do |privacy|
  new_type = Privacy.new(name: privacy)
  new_type.save!
end

100.times do
  new_user = User.new
  new_user.first_name = Faker::Name.first_name
  new_user.last_name = Faker::Name.last_name
  new_user.email = Faker::Internet.safe_email(name: "#{new_user.first_name.downcase}#{new_user.last_name.downcase}")
  new_user.password = 'testpassword123456'
  new_user.password_confirmation = new_user.password
  new_user.save!
end

# sending friend request

User.all.each do |user|
  10.times do
  # send 10 invites
  users_requested = user.invitations_sent
  user_requesters = user.invitations_received
  unrequested_user = User.all.reject{|user| invitations_sent.include?(user) || invitation_received.include?(user)  }
  random_unrequested_user = unrequested_user.sample
  # create a new request
  new_request = user.friend_requests.new
  new_friend = Friend.new
  new_friend.user = random_unrequested_user
  new_friend.save!
  new_request.friend = new_friend
  new_request.friend_request_status = FriendRequestStatus.first
  new_request.save!
  end
end



