class AddBookedToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :booked, :boolean, :default => false

  end
end
