require "rails_helper"

RSpec.describe ContactMailer, :type => :mailer do
  describe "contact_confirmation" do
    let(:contact) { FactoryGirl.create(:contact) }
    let(:mail) { ContactMailer.contact_confirmation(contact) }

    it "renders the headers" do
      expect(mail.subject).to eq("New Contact Submission")
      expect(mail.to).to eq(["hello@meme.menu"])
      expect(mail.from).to eq(["hello@meme.menu"])
    end

    it "renders the body" do
      body = mail.body.encoded
      expect(body).to match(/John/)
      expect(body).to match(/me@johndoe.com/)
      expect(body).to match(/MyText/)
    end
  end

end
