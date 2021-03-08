class CreateInvitationStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :invitation_statuses do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
