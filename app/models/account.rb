class Account < ActiveRecord::Base
  has_many :transactions, :class_name => "Transaction" do
    def balance
      sum(:amount)
    end
  end

end
