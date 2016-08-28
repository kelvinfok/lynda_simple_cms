class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer "page_id", null: false
      t.string "name", null: false
      t.integer "position", null: false
      t.boolean "visible", default: false, null: false
      t.string "content_type", null: false
      t.string "content", null: false
      t.timestamps null: false
    end
    add_index("sections", "page_id")
  end
end
