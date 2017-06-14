class MemesController < ApplicationController

  def index
    @memes = Meme.all
    @most_recent_memes = Meme.most_recent_five
    @older_than_month = Meme.created_before(1.month.ago)
    @created_in_year_2016 = Meme.created_before(Date.new(2017)).created_after(Date.new(2016))
    @created_in_year_2015 = Meme.created_before(Date.new(2016)).created_after(Date.new(2015))
    @created_in_year_2014 = Meme.created_before(Date.new(2015)).created_after(Date.new(2014))
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
