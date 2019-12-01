class AddNewColumnToJobApps < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :your_impression, :string
  end
end
