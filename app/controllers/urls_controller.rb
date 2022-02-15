class UrlsController < ApplicationController
  def index
    @urls  = Url.where(client_ip: client_ip)
  end

  def create
    @url = Url.new(url_params)
    @url.save

    redirect_to root_path
  end

  def show
    url = Url.find_by(short_url_path: params[:short_url_path])
    return unless url.present?

    redirect_to url.original_url

    url.inc(clicks: 1)
  end

  def destroy
    url = Url.find_by(id: params[:id])
    url&.delete

    redirect_to root_path
  end

  private

  def url_params
    params[:url][:client_ip] = client_ip if params[:url]
    params.require(:url).permit(:original_url, :short_url, :short_url_path, :client_ip)
  end
end
