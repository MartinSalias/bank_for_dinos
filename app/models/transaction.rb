class Transaction < ActiveRecord::Base
  belongs_to :account
  validates :amount, :numericality => {:greater_than => 0}

  # def initialize sign=1
  #   @sign = sign
  # end
end
