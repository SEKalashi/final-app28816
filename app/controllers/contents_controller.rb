class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit]

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
  end

  def edit
  end

  private
  def content_params
    params.require(:content).permit(:title, :note, :image).merge(user_id: current_user.id)
  end

  def set_content
    @content = Content.find(params[:id])
  end
end
