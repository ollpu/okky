class Page < ActiveRecord::Base
  validates :text_id,
    presence: true
  # TODO: Sanitize content
end
