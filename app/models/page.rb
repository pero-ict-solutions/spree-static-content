class Page < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of [:slug, :body], :if => :not_using_foreign_link?
  
  named_scope :header_links, :conditions => ["show_in_header = ?", true], :order => 'position'
  named_scope :footer_links, :conditions => ["show_in_footer = ?", true], :order => 'position'
  named_scope :visible, :conditions => {:visible => true}

  def link
    foreign_link.blank? ? slug_link : foreign_link
  end

private  
  def not_using_foreign_link?
    foreign_link.blank?
  end

  def slug_link
    ensure_slash_prefix slug
  end
  
  def ensure_slash_prefix(str)
    str.index('/') == 0 ? str : '/' + str
  end
end