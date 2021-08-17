class LinksController < ApplicationController

  # This action gives tiny url of given link.
  def create
    @short_link = ActionMailer::Base.default_url_options[:host]
    @visited_link = Link.find_by_original_url(link_params[:original_url])
    # Create new link record in DB if link is already not present in database.
    @new_link = Link.create(original_url: link_params[:original_url], token: generate_token) unless @visited_link.present?
  end  

  # This action redirects tiny url to it's original url 
  def show
    @link = Link.find_by_token(params[:token]) 
    if @link.nil?
      flash[:error] = "Invalid Token"
      redirect_to root_path
    else  
      @ip = request.remote_ip   #Fetch ip address of user
      Visitor.update_visitors_count(@link, @ip)  #Increase visited user count
      redirect_to @link.original_url
    end  
  end

  # This action shows information of visited counts of a url 
  def info
    @link = Link.find_by_token(params[:token])
    if @link.nil?
      flash[:error] = "Invalid token" 
      redirect_to lists_links_path 
    else  
      @users = Visitor.where(link_id: @link.id)
    end  
  end  

  # This action lists all url generated in DB
  def lists
    @links = Link.all
    @short_link = ActionMailer::Base.default_url_options[:host]
  end  

  private

  def link_params
    params.require(:link).permit(:original_url)
  end  

  def generate_token
    SecureRandom.uuid[0...8]
  end
end
