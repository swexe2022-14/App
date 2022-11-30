class CreateSpends < ActiveRecord::Migration[5.2]
  def change
    create_table :spends do |t|
      t.string :insititution
      t.integer :spendmoney
      t.string :tag
      t.timestamps
    end
  end
end
