class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :author, references: :users, null: false, foreign_key: { to_table: :users }
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
