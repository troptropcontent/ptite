class AddPrivaciesToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :privacy, null: false, foreign_key: true
  end
end
