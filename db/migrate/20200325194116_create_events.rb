class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :date
      t.string :place
      t.integer :organizer_id

      t.timestamps
    end
  end
end
