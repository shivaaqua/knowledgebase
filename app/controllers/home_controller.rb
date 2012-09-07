class HomeController < ApplicationController
  layout 'home'
  def index
    @snippets = Snippet.recent_four_items
  end
end
