class ChangeNameColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :job_applications, :your_impression
  end
end
