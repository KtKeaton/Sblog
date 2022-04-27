class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.text :content
      t.datetime :delete_at
      t.belongs_to :note, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comments, :delete_at
  end
end
