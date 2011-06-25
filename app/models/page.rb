class Page < ActiveRecord::Base
  default_scope :order => "position ASC"

  validates_presence_of :title
  validates_presence_of [:slug, :body], :if => :not_using_foreign_link?
  
  scope :header_links, where(["show_in_header = ?", true])
  scope :footer_links, where(["show_in_footer = ?", true])
  scope :sidebar_links, where(["show_in_sidebar = ?", true])
  scope :visible, where(:visible => true)
  
  before_save :update_positions_and_slug

  def initialize(*args)
    super(*args)
    last_page = Page.last
    self.position = last_page ? last_page.position + 1 : 0
  end

  def link
    foreign_link.blank? ? slug_link : foreign_link
  end

private

  def update_positions_and_slug
    unless new_record?
      return unless prev_position = Page.find(self.id).position
      if prev_position > self.position
        Page.update_all("position = position + 1", ["? <= position AND position < ?", self.position, prev_position])
      elsif prev_position < self.position
        Page.update_all("position = position - 1", ["? < position AND position <= ?", prev_position,  self.position])
      end
    end

    self.slug = slug_link
    Rails.cache.delete('page_not_exist/' + self.slug)
    return true
  end
  
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
