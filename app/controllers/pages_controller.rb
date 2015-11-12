class PagesController < ApplicationController
  
  # For end user (uses different parameter)
  def view
    @page = Page.find_by text_id: params[:text_id]
    if @page.nil?
      render :not_found, status: :not_found
    end
    authorize @page
  end
  
  def show
    @page = Page.find(params[:id])
    authorize @page
    if @page.nil?
      render :not_found, status: :not_found
    end
  end
  
  def index
    @pages = Page.all
    authorize :page
  end
  
  def new
    @page = Page.new
    authorize @page
  end
  
  def create
    @page = page_params
    authorize @page
    @page.save!
  end
  
  def edit
    @page = Page.find(params[:id])
    authorize @page
  end
  
  def update
    @page = Page.find(params[:id])
    authorize @page
    
    if @page.update(page_params)
      # Success
      redirect_to page_path(@page)
    else
      # Failure
      render 'edit'
    end
  end
  
  def destroy
    @page = Page.get(params[:id])
    authorize @page
    @page.destroy
  end
  
  private
    
    def page_params
      params.require(:page).permit(:text_id, :title, :content)
    end
    # TODO: Move this comment to the model definition
    # TODO: Invalidate header cache when modifying the set of pages
end
