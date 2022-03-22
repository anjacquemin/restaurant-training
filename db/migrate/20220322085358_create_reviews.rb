class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rating
      t.references :rental, null: false, foreign_key: true

      t.timestamps
    end
  end
end
