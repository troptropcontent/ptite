class AddInvitationStatusesToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_reference :invitations, :invitation_status, null: false, foreign_key: true
  end
end
