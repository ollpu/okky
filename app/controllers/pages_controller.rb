class PagesController < ApplicationController
  
  # For end user (uses different parameter)
  def view
    @page = Page.find_by text_id: params[:text_id]
    if @page.nil?
      render :not_found, status: :not_found
      authorize :page
    else
      authorize @page
    end
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
    render :edit
  end
  
  def create
    @page = Page.new(page_params)
    authorize @page
    @page.save!
    redirect_to pages_path
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
    @page = Page.find(params[:id])
    authorize @page
    @page.destroy
    redirect_to pages_path
  end
  
  def order
    @pages_ordered = Page.sorted
    authorize :page
  end
  
  def save_order
    authorize :page
    success = true
    params[:page].each_with_index do |id, i|
      page = Page.find(id)
      page.order = i+1
      unless page.save
        success = false
      end
    end
    render json: { :ok => success }
  end
  
  private
    
    def page_params
      params.require(:page).permit(:text_id, :title, :content)
    end
    # TODO: Move this comment to the model definition
    # TODO: Invalidate header cache when modifying the set of pages
end
