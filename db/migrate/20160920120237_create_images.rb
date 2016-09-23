class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.belongs_to :item
    	t.attachment :avatar

      t.timestamps null: false
    end
  end
end
