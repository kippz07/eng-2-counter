class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :swears, default: 0
      t.integer :swears_today, default: 0
      t.integer :swears_week, default: 0
      t.integer :hacks, default: 0
      t.integer :hacks_today, default: 0
      t.integer :hacks_week, default: 0
      t.timestamps
    end
  end
end
