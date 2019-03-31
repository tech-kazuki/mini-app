class ContentsController < ApplicationController

  def index
  end

  def new
  end

  def create
    Content.create(content: content_params[:content], image: content_params[:image], title: content_params[:title], user_id: current_user.id)
  end

  private
  def content_params
    params.require(:content).permit(:content, :image, :title)
  end
end
