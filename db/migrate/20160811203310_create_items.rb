class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string      :firstname
      t.string      :lastname
      t.attachment  :avatar
      t.string      :email
      t.text        :description
      t.string      :address
      t.string      :phone
      t.string      :code
      t.boolean     :pending
      t.boolean     :approve

      t.timestamps null: false
    end
  end
end
