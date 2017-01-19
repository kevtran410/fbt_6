class CancelTourWorker
  include Sidekiq::Worker

  def perform id
    option = TourOption.includes(:bookings).find id
    option.bookings.each do |booking|
      if booking.paid?
        Stripe::Refund.create charge: booking.charge_id,
          amount: booking.total_price.to_i * 100
      end
      booking.canceled!
      BookingMailer.notify_mail(booking).deliver_later
    end
  end
end
