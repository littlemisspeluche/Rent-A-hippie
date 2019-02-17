class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.text :description
      t.string :location
      t.float :cost
      t.integer :time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
