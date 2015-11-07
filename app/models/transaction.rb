class MyValidator < ActiveModel::Validator
  def validate(record)
    if (record.sign.to_i < 0 && record.amount > 0) || (record.sign.to_i > 0 && record.amount < 0)
      record.errors[:amount] << 'Incorrect amount!'
    end
  end
end

class Transaction < ActiveRecord::Base
  belongs_to :account
  #validates :amount, :numericality => {:greater_than => 0}
  validate :validate_amount
  #validates_with MyValidator

  attr_accessor :sign

  def validate_amount
    if (sign.to_i < 0 && amount > 0) || (sign.to_i > 0 && amount < 0)
      errors.add(:amount,'Incorrect amount!')
    end
  end
end
