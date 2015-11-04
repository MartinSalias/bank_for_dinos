class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.references :account, index: true, foreign_key: true
      t.date :date_on
      t.string :note

      t.timestamps null: false
    end
  end
end
