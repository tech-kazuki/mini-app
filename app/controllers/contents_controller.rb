class ContentsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @contents = Content.includes(:user).all
  end

  def new
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

  private
  def content_params
    params.require(:content).permit(:content, :image, :title)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
