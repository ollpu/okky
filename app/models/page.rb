class Page < ActiveRecord::Base
  validates :text_id,
    presence: true
  # TODO: Sanitize content
  
  def self.sorted
    Page.all.sort do |a, b|
      a.order <=> b.order
    end
  end
end
