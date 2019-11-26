class AddInterviewerToInterviews < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :interviewer_name, :string
    add_column :interviews, :interviewer_email, :string
  end
end
