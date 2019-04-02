class ContentsController < ApplicationController

  def index
    @contents = Content.includes(:user).all.order("created_at DESC")
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def create
    Content.create(content: content_params[:content], image: content_params[:image], title: content_params[:title], user_id: current_user.id)
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    content = Content.find(params[:id])
    if content.user_id == current_user.id
      content.update(content_params)
    end
    redirect_to action: :index
  end

  def destroy
    content = Content.find(params[:id])
    content.destroy
    redirect_to action: :index
  end

  private
  def content_params
    params.require(:content).permit(:content, :image, :title)
  end
end
