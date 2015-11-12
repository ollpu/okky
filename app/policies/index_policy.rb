
class IndexPolicy < ApplicationPolicy
  def index?
    true # Everyone can view the front page of the website
  end
end
