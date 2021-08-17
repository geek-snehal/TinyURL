class Link < ApplicationRecord

  validates_presence_of :original_url
  validate :url_format
  validates_uniqueness_of :token

  has_many :visitors

  def url_format
    uri = URI.parse(original_url)
    if uri.host.nil?
      errors.add(:original_url, "Invalid format")
    end  
  end  
  
end
