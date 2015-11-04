class RemoveColumnDateOnToTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :date_on, :string
  end
end
