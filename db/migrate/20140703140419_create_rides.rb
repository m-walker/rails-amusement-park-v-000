class CreateRides < ActiveRecord::Migration
  
  def change
    create_table :rides do |t|
      t.integer :user_id
      t.belongs_to :attraction
    end
  end

end
