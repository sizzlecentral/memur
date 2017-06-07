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
    @meme = Meme.new(meme_params)
    if @meme.save
      redirect_to "/memes"
    else
      render :new
    end
  end

  def edit
    @meme = Meme.find(params[:id])
  end

  def update
    @meme = Meme.find(params[:id])
    if @meme.update_attributes(meme_params)
      redirect_to "/memes/#{@meme.id}"
    else
      render :edit
    end
  end

  def destroy
    @meme = Meme.find(params[:id])
    @meme.destroy
    redirect_to "/memes"
  end

  def meme_params
    { title: params[:meme][:title], url: params[:meme][:url] }
  end

end
