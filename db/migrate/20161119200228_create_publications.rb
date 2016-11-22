class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.text :description
      t.date :publication_date
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :publications, [:user_id, :created_at]
  end
end
