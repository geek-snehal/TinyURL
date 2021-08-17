class Link < ApplicationRecord

  validates_presence_of :original_url
  validates :original_url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :token

  has_many :visitors
  
end
