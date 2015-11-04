require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase
  setup do
    @transaction = transactions(:one)
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post :create, transaction: { account_id: @transaction.account_id, amount: @transaction.amount, date_on: @transaction.date_on, note: @transaction.note }
    end

    assert_redirected_to transaction_path(assigns(:transaction))
  end
end
