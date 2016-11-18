class CreateOutfitRecs < ActiveRecord::Migration[5.0]
  def change
    create_table :outfit_recs do |t|
      t.string :user_id
      t.string :clothes_ids
      t.string :date

      t.timestamps
    end
  end
end
