class ArticlesController < ApplicationController
  include ArticlesHelper
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # @article = Article.new
    # @article.title = params[:article][:title]
    # @article.save
    # @article = Article.create!(title: params[:article][:title], body: params[:article][:body])
    # @article = Article.create!(params[:article]) --> won't work for security reasons. (Strong parameters)
    @article = Article.create!(article_params) # article_params is method in article helper
    flash.notice = "Article '#{@article.title}' Created!"
    redirect_to article_path(@article)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params) # update is rails method update.
    flash.notice = "Article '#{@article.title}' Updated!" # need to add to view/layout
    redirect_to article_path(@article)
  end

  def destroy
    flash.notice = "Article Deleted!"
    Article.delete(Article.find(params[:id]))
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end
end
