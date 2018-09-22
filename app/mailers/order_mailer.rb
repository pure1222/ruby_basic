class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_confirm.subject
  #
  def order_confirm(guest)
     @guest = guest
     mail to: guest.email, subject: "ご購入ありがとうございます"
  end
end