class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.string :about
    	t.string :detail
    	t.date :limit

      t.timestamps null: false
    end
  end
end
