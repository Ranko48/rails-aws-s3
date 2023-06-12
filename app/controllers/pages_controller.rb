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

  def videos
  end

  def merch
  end

  def under_construction
  end
end
