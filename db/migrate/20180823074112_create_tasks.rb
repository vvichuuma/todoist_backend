class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :date
      t.time :time
      t.string :user_id

      t.timestamps
    end
  end
end
