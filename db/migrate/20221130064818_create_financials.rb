class CreateFinancials < ActiveRecord::Migration[5.2]
  def change
    create_table :financials do |t|
      t.string :insititution
      t.integer :usable
      t.integer :user_id
      t.timestamps
    end
  end
end
