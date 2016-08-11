class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string 			:firstname
      t.string 			:lastname
      t.attachment 	:avatar
      t.string 			:email
      t.text   			:description
      t.string 			:address
      t.integer 		:phone
      t.integer   	:code
      t.boolean			:pending 

      t.timestamps null: false
    end
  end
end
