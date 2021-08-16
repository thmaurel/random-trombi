class AddActiveToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :active, :boolean
  end
end
