module DefaultPageContent
extend ActiveSupport::Concern

  included do
   before_action :set_title
  end

  def set_title
    @page_title = "Owen Magdiel | My Portfolio Website"
    @seo_keywords = "Owen Magdiel"
  end

end
