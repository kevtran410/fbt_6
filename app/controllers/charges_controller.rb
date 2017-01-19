class ChargesController < ApplicationController
  rescue_from Stripe::CardError do |exception|
    flash[:error] = exception.message
    redirect_to :back
  end

  def create
    booking = Booking.find params[:booking_id]
    customer = Stripe::Customer.create(
      email: params[:stripe_email],
      source: params[:stripe_token]
    )
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: booking.total_price.to_i * 100,
      currency: "usd"
    )
    booking.charge_id =  charge.id
    booking.paid!
    redirect_to booking
  end

  def update
    booking = Booking.find params[:id]
    Stripe::Refund.create(
      charge: booking.charge_id,
      amount: (booking.total_price*0.7*100).to_i
    )
    booking.canceled!
    redirect_to booking
  end
end
