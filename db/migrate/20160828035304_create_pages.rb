class CreatePages < ActiveRecord::Migration

  def up
    create_table :pages do |t|
      t.integer "subject_id"
      # same as: t.references :subject
      t.string "name", null: false
      t.string "permalink", null: false
      t.integer "position", null: false
      t.boolean "visible", default: false, null: false
      t.timestamps null: false
    end
      # adding foreign key
      add_index("pages", "subject_id")
      add_index("pages", "permalink")
  end

  def down
    drop_table :pages
  end
  
end
