class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :interviews, :application_id, :job_application_id
  end
end
