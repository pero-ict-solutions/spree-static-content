class Spree::Page < ActiveRecord::Base
  default_scope :order => "position ASC"

  validates_presence_of :title
  validates_presence_of [:slug, :body], :if => :not_using_foreign_link?
  validates_presence_of :layout, :if => :render_layout_as_partial?

  validates :slug, :uniqueness => true, :if => :not_using_foreign_link?
  validates :foreign_link, :uniqueness => true, :allow_blank => true

  scope :visible, where(:visible => true)
  scope :header_links, where(:show_in_header => true).visible
  scope :footer_links, where(:show_in_footer => true).visible
  scope :sidebar_links, where(:show_in_sidebar => true).visible

  before_save :update_positions_and_slug

  attr_accessible :title, :slug, :body, :meta_title, :meta_keywords, :meta_description, :layout, :foreign_link, :position, :show_in_sidebar, :show_in_header, :show_in_footer, :visible, :render_layout_as_partial

  def self.by_slug(slug)
    slug = StaticPage::remove_spree_mount_point(slug)
    pages = self.arel_table
    query = pages[:slug].eq(slug).or(pages[:slug].eq("/#{slug}"))
    self.where(query)
  end

  def initialize(*args)
    super(*args)

    last_page = Spree::Page.last
    self.position = last_page ? last_page.position + 1 : 0
  end

  def link
    foreign_link.blank? ? slug : foreign_link
  end

private

  def update_positions_and_slug
    unless new_record?
      return unless prev_position = Spree::Page.find(self.id).position
      if prev_position > self.position
        Spree::Page.update_all("position = position + 1", ["? <= position AND position < ?", self.position, prev_position])
      elsif prev_position < self.position
        Spree::Page.update_all("position = position - 1", ["? < position AND position <= ?", prev_position,  self.position])
      end
    end

    return true
  end

  def not_using_foreign_link?
    foreign_link.blank?
  end
end
