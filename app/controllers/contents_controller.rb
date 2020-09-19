class ContentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_content, only: [:show, :edit, :update]

  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
    redirect_to content_path(@content)
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @content.user != current_user
       redirect_to content_path, alert: '不正なアクセスです。' 
    end
  end

  def update
    if @content.update(content_params)
       redirect_to content_path(@content)
    else
      render :edit
    end
  end

  def destroy
    content = Content.find(params[:id])
    content.destroy
    redirect_to contents_path
  end

  private
  def content_params
    params.require(:content).permit(:title, :note, :image).merge(user_id: current_user.id)
  end

  def set_content
    @content = Content.find(params[:id])
  end
end
