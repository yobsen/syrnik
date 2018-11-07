# frozen_string_literal: true

class AddPetIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :pet_id, :integer
  end
end
