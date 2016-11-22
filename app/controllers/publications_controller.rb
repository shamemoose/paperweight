class PublicationsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def destroy
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = current_user.publications.build(publication_params)

    if @publication.save
      flash[:success] = "Publication uploaded!"
      redirect_to @publication
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @publication.destroy
    flash[:success] = "Publication deleted"
    redirect_to request.referrer || root_url
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:title, :description)
    end

    def correct_user
      @publication = current_user.publications.find_by(id: params[:id])
      redirect_to root_url if @publication.nil?
    end
end