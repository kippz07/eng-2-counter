class CreateHacks < ActiveRecord::Migration[5.1]
  def change
    create_table :hacks do |t|
      t.timestamps
    end
  end
end
