class Page < ActiveRecord::Base
  validates :text_id,
    presence: true
  validates :order,
    presence: true
  before_validation :define_order
  # TODO: Sanitize content
  
  def self.sorted
    Page.all.sort do |a, b|
      a.order <=> b.order
    end
  end
  
  private
  def define_order
    self.order = id
  end
end
