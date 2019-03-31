class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.text :content
      t.string :title
      t.text :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
