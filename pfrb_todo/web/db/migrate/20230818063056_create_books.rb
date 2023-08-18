class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.date :published_on
      t.string :price
      t.string :integer

      t.timestamps
    end
  end
end
