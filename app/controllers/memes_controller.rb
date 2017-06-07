class MemesController < ApplicationController

  def index
    @memes = Meme.all
  end

  def show
    @meme = Meme.find(params[:id])
  end

  def new
    @meme = Meme.new
  end

  def create
    @meme = Meme.new(picture_params)
    if @meme.save
      redirect_to "/memes"
    else
      render :new
    end
  end

  def picture_params
    { title: params[:meme][:title], url: params[:meme][:url] }
  end

end
