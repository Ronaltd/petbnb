class AddPhotoToLocal < ActiveRecord::Migration[6.0]
  def change
    add_column :locals, :photo, :string
  end
end
