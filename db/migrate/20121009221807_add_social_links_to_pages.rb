class AddSocialLinksToPages < ActiveRecord::Migration
  def change
    add_column :refinery_pages, :show_social_plugin, :boolean, default: false
  end
end
