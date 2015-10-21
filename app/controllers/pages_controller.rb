class PagesController < ApplicationController
  def view
    @page = Page.find_by text_id: params[:text_id]
    if @page.nil?
      render :not_found, status: :not_found
    end
  end
  
  # TODO: Invalidate header cache when modifying the set of pages
end
