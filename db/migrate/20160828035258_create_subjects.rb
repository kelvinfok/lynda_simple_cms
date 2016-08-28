class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string "name", null: false
      t.integer "position", null: false
      t.boolean "visible", default: false, null: false
      t.timestamps null: false
    end
  end
end
