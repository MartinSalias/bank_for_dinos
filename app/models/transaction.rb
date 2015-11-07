class Transaction < ActiveRecord::Base
  belongs_to :account
  #validates :amount, :numericality => {:greater_than => 0}

  attr_accessor :sign


end
