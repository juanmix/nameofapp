class PaymentsController < ApplicationController

  def create
    #when we created the hidden field(products/show), we added a parameter to the params. That's how
    # we can access it now. Now you can use that instance variable to access the price or ID of the
    #product that has been bought.
    @product = Product.find(params[:product_id])

    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => number_to_currency(@product.price), # amount in cents, again
        :currency => "eur",
        :source => token,
        :description => params[:stripeEmail]
      )

      #conditional to check if payment is succesful.
      if charge.paid # '.paid' stripe method to confirm payment.
        Order.create(
          product_id: @product.id,
          user_id: @user_id,
          total: number_to_currency(@product.price)
          )
      end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    redirect_to product_path(@product)

  end




end
