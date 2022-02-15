class Url
  include Mongoid::Document
  include Mongoid::Timestamps

  field :original_url, type: String
  field :short_url, type: String
  field :short_url_path, type: String
  field :client_ip, type: String

  field :clicks, type: Integer, default: 0

  validates_presence_of :original_url, :short_url, :short_url_path
  validates_uniqueness_of :short_url, :short_url_path
end
