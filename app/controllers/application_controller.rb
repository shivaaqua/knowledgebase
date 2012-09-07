class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :snippet_types
  
  def snippet_types
    SnippetType.order(:name)
  end
end
