module ImageAttachment
  extend ActiveSupport::Concern

  class AttachmentValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      if record.avatar.queued_for_write[:original].present?
        geometry = Paperclip::Geometry.from_file(record.avatar.queued_for_write[:original].path)
        if geometry.width < options[:width] || geometry.height < options[:height]
          record.errors.add(:avatar_dimension, 'is too small.')
        end
      end
    end
  end

  def clean_cloudfront_url
    if avatar.dirty?
      self.cloudfront_url = nil
    end
  end

  def create_cloudfront_url
    if cloudfront_url.nil?
      bucket_name = Rails.env.test? ? 'test' : avatar.bucket_name
      self.cloudfront_url = avatar.url.gsub(
        "http://s3.amazonaws.com/#{bucket_name}",
        "http://#{Rails.configuration.cloudfront_subdomain}.cloudfront.net"
      ).gsub('original', 'large')
      save
    end
  end

  class_methods do
    def image_attachment(opts = {})
      raise "Missing Styles" unless opts[:styles]

      opts[:default_url] ||= "https://s3.amazonaws.com/meme-menu/missing_small.jpg"
      has_attached_file :avatar, styles: opts[:styles], default_url: opts[:default_url]
      validates_attachment_content_type :avatar, content_type: ["image/jpeg", "image/png"]
      after_save :create_cloudfront_url
      before_save :clean_cloudfront_url

      dimensions = /(\d+)x(\d+)>/.match(opts[:styles][:large])
      width, height = dimensions[1], dimensions[2]

      validates :avatar, attachment: { width: width.to_i, height: height.to_i }
    end
  end
end

ActiveRecord::Base.send(:include, ImageAttachment)
