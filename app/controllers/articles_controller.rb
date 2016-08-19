 class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :publish, :unpublish, :revise]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.published.from_new
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
    unless current_user.id == @article.user_id
      redirect_to root_path
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to root_path, notice: 'Article was successfully created.' }
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
        format.html { redirect_to root_path, notice: 'Article was successfully updated.' }
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

  def my_articles
    @user_id = current_user.id
    @articles = Article.all.my_articles(@user_id).from_new
  end

  def news
    @articles = Article.all.news.published.from_new
    render "index"
  end

  def reviews
    @articles = Article.all.reviews.published.from_new
    render "index"
  end

  def unboxing
    @articles = Article.all.unboxing.published.from_new
    render "index"
  end

  def gameplays
    @articles = Article.all.gameplays.published.from_new
    render "index"
  end

  def to_revise
    @created_articles = Article.all.created
    @published_articles = Article.all.published
    @unpublished_articles = Article.all.unpublished
  end

  def publish
    @article.publish!
    redirect_to to_revise_path
  end

  def unpublish
    @article.unpublish!
    redirect_to to_revise_path
  end

  def revise
    @article.revise!
    redirect_to to_revise_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name, :cover, :body, :sinopsis, :youtube, :category)
    end
end
