
class PagePolicy < ApplicationPolicy
  def view?
    true # Todo: check for .public or similar
  end
  
  def show?
    user and user.editor?
  end
  
  def index?
    show?
  end
  
  def create?
    show?
  end
  
  def update?
    show?
  end
  
  def destroy?
    show?
  end
end
