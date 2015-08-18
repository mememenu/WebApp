class AddSocialNetworksFkToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :facebook_id
      t.string :twitter_id
      t.string :instagram_id
    end
  end
end
