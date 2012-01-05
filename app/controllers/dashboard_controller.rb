class DashboardController < ApplicationController

  # GET /dashboard
  # GET /dashboard.xml
  # GET /dashboard.json                                       HTML and AJAX
  #-----------------------------------------------------------------------
  def index
    @page_title = "Dashboard"
    flash[:error] = "ZOMG, WTF HAPPENED!!!!"
    flash[:notice] = "Yah, so this is some serious info!"
    flash[:warning] = "You have been told!"
    @clusters = Cloud::Control.get_clusters

    respond_to do |format|
      format.json { render :json => @clusters }
      format.xml  { render :xml  => @clusters }
      format.html
    end
  end

end
