class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references  :place, foreign_key: true
      t.datetime :date
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
