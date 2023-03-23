class PagesController < ApplicationController
  def main
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
