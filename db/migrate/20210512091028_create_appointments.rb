class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :body
      t.boolean :closed
      t.references :category, null: false, foreign_key: true
      t.integer :parent_id
      t.integer :user_id
      t.timestamps
    end
  end
end
