class ContentsController < ApplicationController
  def index
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    @content.save
    redirect_to content_path(@content)
  end

  def show
    @content = Content.find(params[:id])
  end

  def edit
  end

  private
  def content_params
    params.require(:content).permit(:title, :note, :image).merge(user_id: current_user.id)
  end
end
