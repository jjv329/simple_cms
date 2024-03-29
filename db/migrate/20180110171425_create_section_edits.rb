class CreateSectionEdits < ActiveRecord::Migration[5.1]
  def change
    create_table :section_edits do |t|
      t.integer :user_id
      t.integer :section_id
      t.string :summary

      t.timestamps
    end
    add_index :section_edits, [:user_id, :section_id]
  end
end
