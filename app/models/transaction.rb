class MyValidator < ActiveModel::Validator
  def validate(record)
    if (record.sign.to_i < 0 && record.amount > 0) ||
      (record.sign.to_i < 0 && record.account.balance < record.amount) ||
      (record.sign.to_i > 0 && record.amount < 0)
      record.errors[:amount] << 'Incorrect amount!'
    end
  end
end

class Transaction < ActiveRecord::Base
  belongs_to :account
  #validates :amount, :numericality => {:greater_than => 0}
  validate :validate_amount
  #validates_with MyValidator

  attr_accessor :sign, :account_to_id

  def validate_amount
    if (sign.to_i < 0 && amount > 0) ||
       ( sign.to_i < 0 && account.transactions.balance < amount) ||
       (sign.to_i > 0 && amount < 0)
      errors.add(:amount,'Incorrect amount!')
    end
  end

  def transfer(extract_from,deposit_to)
    Transaction.transaction do
      extract_to.save!
      deposit_to.save!
    end
  end

end
