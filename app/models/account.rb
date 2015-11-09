class Account < ActiveRecord::Base

  validates :name, :presence => true

  has_many :transactions, :dependent => :restrict_with_error , :class_name => "Transaction" do
    def balance
      sum(:amount)
    end
  end

end
