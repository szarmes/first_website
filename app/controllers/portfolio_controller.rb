class PortfolioController < ApplicationController

  before_action :admin_user,     only: [:create, :destroy ]

  def index
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
        flash[:error]= "Upload not complete!"
        redirect_to '/portfolio'
      end
    end
  end
  
  
  def destroy
    
    @upload = Uploads.find_by(params[:id])
    @upload.destroy
    flash[:success] = "Upload deleted."
    redirect_to '/portfolio'
  end
  
    
    # normal save
  private
  def project_params
    params.require(:uploads).permit(:title,:content,:avatar)
  end
  def admin_user
      redirect_to(root_url) unless user_signed_in? and current_user.admin?
  end
  
  
end
	