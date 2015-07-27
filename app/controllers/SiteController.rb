class SiteController < Techlog
  def initialize obj
    super
  end

  def index
    @response.status = 200
    @response.write Site.all.to_json
    @response
  end
end