class PagesController < ApplicationController
  def main
    @last_article = Article.last
  end

  def about
  end

  def blog
    @articles = Article.all
  end

  def politics
  end

  def terms
  end
end
