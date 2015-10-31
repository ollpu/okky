class PagesController < ApplicationController
  
  # For end user (uses different parameter)
  def view
    @page = Page.find_by text_id: params[:text_id]
    # auth
    if @page.nil?
      render :not_found, status: :not_found
    end
  end
  
  def index
    @pages = Page.all
    # auth (not with array?)
  end
  
  def new
    @page = Page.new
    # auth
  end
  
  def create
    @page = page_params
    # auth
    @page.save!
  end
  
  def edit
    @page = Page.get(params[:id])
    # auth
  end
  
  def update
    @page = page_params
    # auth
    @page.save!
  end
  
  def destroy
    @page = Page.get(params[:id])
    # auth
    @page.destroy
  end
  
  private
    
    def page_params
      params.require(:page).permit(:text_id, :title, :content)
    end
    # TODO: Move this comment to the model definition
    # TODO: Invalidate header cache when modifying the set of pages
end
