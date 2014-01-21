class ChargesController < ApplicationController

  def new
  end

  def index
  end
    
  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd',
     )  

    capture = false
    

    # save_stripe_customer_id(user, customer.id)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  
  end

  def show

  end  

  def save
  save_stripe_customer_id(user, customer.id)
  end
  
  def later
    customer_id = get_stripe_customer_id(user)
  end  
end

