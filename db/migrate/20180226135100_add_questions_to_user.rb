class AddQuestionsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :dreamt_job, :text
    add_column :users, :dad_job, :text
    add_column :users, :mum_job, :text
    add_column :users, :admired_person, :text
    add_column :users, :partner_job, :text
    add_column :users, :children_job, :text
  end
end
