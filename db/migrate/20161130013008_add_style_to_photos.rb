class AddStyleToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :style, :string
  end
end
