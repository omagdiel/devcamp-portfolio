class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
    @copyright = MaggiesViewTool::Renderer.copyright 'Owen Magdiel',
    'All rights reserved'
  end
end
