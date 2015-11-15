class Page < ActiveRecord::Base
  validates :text_id,
    presence: true
  validates :order,
    numericality: { greater_than: 0 }
  before_validation :define_order
  # TODO: Sanitize content
  
  def self.sorted
    Page.all.sort do |a, b|
      a.order <=> b.order
    end
  end
  
  # TODO: Invalidate header cache when modifying the set of pages
  
  private
    def define_order
      if not order or order == 0
        self.order = Page.count
      end
    end
    
    def after_save
      expire_fragment 'nav'
    end
    def after_destroy; after_save; end
end
