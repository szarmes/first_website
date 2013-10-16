class PortfolioController < ApplicationController



  def new
    @newUpload = Uploads.new if user_signed_in?
    @items = Uploads.paginate(page: params[:page])
  end
  def show
    @newUpload = Uploads.new if user_signed_in?
    @items = Uploads.paginate(page: params[:page])
  end
 
  def create
    if user_signed_in?
    # build a photo and pass it into a block to set other attributes
    @newUpload = Uploads.new(project_params)
      if @newUpload.save
        flash[:success]= "Upload complete!"
        redirect_to '/portfolio'
      else
        redirect_to '/portfolio'
      end
    end
  end
  def index
    @newUpload = Uploads.new if user_signed_in?
    @items = Uploads.paginate(page: params[:page])
  end

  
    
    # normal save
  private
  def project_params
    params.require(:uploads).permit(:title,:content,:avatar)
  end
  
  
end
	