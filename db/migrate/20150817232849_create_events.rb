class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :location
      t.references :user, index: true
      t.timestamps
    end
  end
end
