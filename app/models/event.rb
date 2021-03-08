class Event < ApplicationRecord
  has_many :invitations
  belongs_to :place
  belongs_to :user
  belongs_to :privacy
end
