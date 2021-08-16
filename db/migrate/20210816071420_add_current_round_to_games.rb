class AddCurrentRoundToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :current_round, :integer
  end
end
