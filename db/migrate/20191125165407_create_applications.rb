class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :status
      t.references :user, foreign_key: true
      t.string :job_title
      t.string :company_name
      t.string :recruiter_name
      t.string :recruiter_email
      t.boolean :favorite

      t.timestamps
    end
  end
end
