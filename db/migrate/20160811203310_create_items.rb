class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to  :category, index: true
      t.belongs_to  :country, index: true
      t.string      :name
      t.attachment  :avatar
      t.string      :email
      t.string      :location
      t.text        :title
      t.text        :description
      t.decimal     :price
      t.string      :address
      t.string      :phone
      t.string      :code
      t.boolean     :pending
      t.boolean     :approve

      t.timestamps null: false
    end
  end
end
