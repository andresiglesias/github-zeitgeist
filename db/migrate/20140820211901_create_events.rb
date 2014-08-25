class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :media
      t.string :media_attribution
      t.string :media_description
      t.date :since
      t.date :until
      t.integer :compare
      t.string :category
      t.string :keyword_push
      t.string :keyword_repos
      t.integer :value_push_0
      t.integer :value_push_1
      t.integer :value_repos_0
      t.integer :value_repos_1
      
      t.timestamps
    end
  end
end
