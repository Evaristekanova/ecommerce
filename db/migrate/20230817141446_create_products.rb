class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :tittle
      t.decimal :price
      t.boolean :published
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
