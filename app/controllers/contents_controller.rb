class ContentsController < ApplicationController

  def index
    @content = Content.new
  end

  def new
  end

  def create
    binding.pry
    Contents.create(content: content_params[:content], image: content_params[:image], title: content_params[:title], user_id: current_user.id)
  end

  private
  def content_params
    params.parmit(:content, :image, :title)
  end
end
