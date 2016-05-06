class OrdersController < ApplicationController
  def new
    @client_token = Braintree::ClientToken.generate
  end

  def create
  nonce = params[:payment_method_nonce]
  render action: :new and return unless nonce
  result = Braintree::Transaction.sale(
    amount: "10.00",
    payment_method_nonce: nonce
  )

  if result.success?
    flash[:notice] = "Payment Successfull"
    current_user.has_paid = true
    current_user.save
    redirect_to new_application_path
  else
    flash[:alert] = "Something is amiss. #{result.transaction.processor_response_text}" unless result.success?
    render 'new'
  end

  end
end
