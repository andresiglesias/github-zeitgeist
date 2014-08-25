class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.string :name
      t.string :description
      t.string :media
      t.string :media_attribution
      t.string :media_description
      t.date :since
      t.date :until
      t.date :last_updated
      
      t.timestamps
    end
  end
end
