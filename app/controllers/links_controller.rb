class LinksController < ApplicationController

  def create
    @short_link = ActionMailer::Base.default_url_options[:host]
    @old_link = Link.find_by_original_url(link_params[:original_url])
    @new_link = Link.create(original_url: link_params[:original_url], token: generate_token) unless @old_link.present?
  end  

  def show
    @link = Link.find_by_token(params[:token]) 
    redirect_to root if @link.nil?
    @ip = request.remote_ip
    puts @ip
    Visitor.update_visitors_count(@link,@ip)
    redirect_to @link.original_url
  end

  def info
    @link = Link.find_by_token(params[:token]) 
    @users = Visitor.where(link_id: @link.id)
  end  

  private

  def link_params
    params.require(:link).permit(:original_url)
  end  

  def generate_token
    SecureRandom.uuid[0...8]
  end
end
