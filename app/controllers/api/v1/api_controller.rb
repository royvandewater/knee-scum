class Api::V1::ApiController < ApplicationController
  before_filter :require_authentication

  def require_authentication
    unless Rails.env == 'test'
      authenticate_or_request_with_http_basic do |username, password|
        username == "twothirdsclimbing" && password == "tookitooki"
      end
    end
  end
end
