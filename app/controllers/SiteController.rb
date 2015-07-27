class SiteController < Techlog
  def initialize obj
    super
  end

  def show(ids)
    @response.write Site.find(ids[:site]).to_json
    super
  end

  def index
    @response.write Site.all.to_json
    super
  end
end