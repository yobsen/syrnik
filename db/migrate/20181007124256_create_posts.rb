class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :photo
      t.text :description
      t.float :weight

      t.timestamps
    end
  end
end
