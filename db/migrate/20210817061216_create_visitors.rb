class CreateVisitors < ActiveRecord::Migration[6.0]
  def change
    create_table :visitors do |t|
      t.string :ip_addr
      t.integer :user_clicks
      t.integer :link_id
    end
  end
end
