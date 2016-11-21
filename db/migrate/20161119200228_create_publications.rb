class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.text :description
      t.date :publication_date
      t.references :user, index: true

      t.timestamps
    end
  end
end
