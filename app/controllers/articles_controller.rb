class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def generate
    require 'open-uri'
    # clean_articles
    generate_articles(params[:count].to_i)
    redirect_to root_path
  end

  # GET /articles
  # GET /articles.json
  def index
    search_key = "%#{params[:search]}%"
    @articles = Article.where('title like :criteria or abstract like :criteria or content like :criteria',criteria: search_key).to_a
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :abstract, :content)
    end


    def generate_articles(count)
      count.times do
        rnd_article = Nokogiri::HTML(open("http://pdos.csail.mit.edu/cgi-bin/sciredirect.cgi"))
        # rnd_article = Nokogiri::HTML(open("http://scigen.csail.mit.edu/scicache/870/scimakelatex.23796.none.html"))
        title = rnd_article.css('h1')[0].text.squish
        abstract = rnd_article.css('div.p')[2].next.text.squish
        content = (rnd_article.css('br')[4].next.text + rnd_article.css('br')[5].next.text + rnd_article.css('br')[6].next.text).squish
        Article.new(title: title, abstract: abstract, content: content).save!
      end
    end

    def clean_articles
      Article.delete_all
    end
end
