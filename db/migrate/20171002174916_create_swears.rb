class CreateSwears < ActiveRecord::Migration[5.1]
  def change
    create_table :swears do |t|
      t.belongs_to :people, index: true
      t.timestamps
    end
  end
end
