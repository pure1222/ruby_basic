class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_confirm.subject
  #
  def order_confirm(guest)
    @guest = guest
     mail to: guest.email, subject: "{no go}ご購入ありがとうございます"
  end
  def manager_post(items,guest)
    @guest = guest
    @items = items
    mail to: "nogo0924mmn@gmail.com", subject: "注文情報"
  end
end
