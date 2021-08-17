class Visitor < ApplicationRecord

  def self.update_visitors_count(link, ip)
      visitor = Visitor.where(link_id: link.id, ip_addr: ip).first
      if visitor.present?
        visitor.update_attributes(user_clicks: visitor.user_clicks + 1)  
      else
        Visitor.create(ip_addr: ip, user_clicks: 1, link_id: link.id)
      end          
  end
end  
  