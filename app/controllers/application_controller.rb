class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def client_ip
    request.remote_ip
  end
end
