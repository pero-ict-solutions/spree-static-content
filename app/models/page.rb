class Page < ActiveRecord::Base
  default_scope :order => "position ASC"

  validates_presence_of :title
  validates_presence_of [:slug, :body], :if => :not_using_foreign_link?
  
  named_scope :header_links, :conditions => ["show_in_header = ?", true], :order => 'position'
  named_scope :footer_links, :conditions => ["show_in_footer = ?", true], :order => 'position'
  named_scope :sidebar_links,:conditions => ["show_in_sidebar = ?", true], :order => 'position'
  
  named_scope :visible, :conditions => {:visible => true}

  def initialize(*args)
    super(*args)
    last_page = Page.last
    self.position = last_page ? last_page.position + 1 : 0
  end

  def before_save
    unless new_record?
      return unless prev_position = Page.find(self.id).position
      if prev_position > self.position
        Page.update_all("position = position + 1", ["? <= position AND position < ?", self.position, prev_position])
      elsif prev_position < self.position
        Page.update_all("position = position - 1", ["? < position AND position <= ?", prev_position,  self.position])
      end
    end
    
    self.slug = slug_link
    
  end

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