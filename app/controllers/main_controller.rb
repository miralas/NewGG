class MainController < ApplicationController

  def index
    @news = News.last(10).reverse
  end
end
