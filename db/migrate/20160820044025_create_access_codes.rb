class CreateAccessCodes < ActiveRecord::Migration
  def change
    create_table :access_codes do |t|
    	t.string 	:al_code
    	t.string 	:ks_code
    	t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
