class AddLikeToOutfitRecs < ActiveRecord::Migration[5.0]
  def change
    add_column :outfit_recs, :like, :integer
  end
end
