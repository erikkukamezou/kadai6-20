class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: "erikkukamezoudayo@yahoo.co,jp", subject: "投稿完了メール"
  end
end
