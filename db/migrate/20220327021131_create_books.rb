class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false, default: ''
      t.string :auther, null: false, default: ''
      t.string :publisher, null: false, default: ''
      t.datetime :published_on, null: false
      t.string :series
      t.integer :page_size

      t.timestamps
    end
  end
end
