class Removeuseridcolumn < ActiveRecord::Migration[5.2]
  def change

     remove_column :tasks, :user_id, :string

  end
end
