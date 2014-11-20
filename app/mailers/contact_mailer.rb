class ContactMailer < ActionMailer::Base
  default from: "hello@meme.menu"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_confirmation.subject
  #
  def contact_confirmation(contact)
    @contact = contact

    mail to: "hello@meme.menu", subject: "New Contact Submission"
  end

end
