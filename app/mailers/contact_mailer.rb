class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "lll@lll.com", subject: "投稿完了のメール"
  end
end
