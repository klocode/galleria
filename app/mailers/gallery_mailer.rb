class GalleryMailer < ApplicationMailer

  def share(gallery, send_to, user)
    @gallery = gallery
    mail(to: send_to, from: user.email, subject: "Check this amazing photo gallery from ShutterUp!")
  end

end
