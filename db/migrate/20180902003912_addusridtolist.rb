class Addusridtolist < ActiveRecord::Migration[5.2]
  def change

     add_column :lists, :userid, :integer

  end
end
