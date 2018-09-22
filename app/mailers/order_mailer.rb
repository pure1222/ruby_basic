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
  def manager_post(items)
    @items = items
    mail to: "msyaaa634@yahoo.co.jp", subject: "注文情報"
  end
end
