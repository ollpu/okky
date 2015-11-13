
class AdminPolicy < ApplicationPolicy
  def index?
    user and user.editor?
    true # TEMPORARY
  end
end
