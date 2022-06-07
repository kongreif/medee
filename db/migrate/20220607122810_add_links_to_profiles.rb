class AddLinksToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :soundcloud_link, :string
    add_column :profiles, :instagram_link, :string
    add_column :profiles, :facebook_link, :string
  end
end
