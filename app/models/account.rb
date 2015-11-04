class Account < ActiveRecord::Base
  has_many :transactions, :class_name => "Transaction", :foreign_key => "id"
end
