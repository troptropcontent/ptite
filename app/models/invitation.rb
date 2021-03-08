class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :invitation_status
end
