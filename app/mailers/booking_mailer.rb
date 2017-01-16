class BookingMailer < ApplicationMailer
  def notify_mail booking
    @booking = booking
    mail to: @booking.email, subject: t("mailer.#{@booking.status}_subject")
  end
end
