class SiteController < Techlog
  def initialize obj
    super
  end

  def show(ids)
    @response.status = 200
    @response.write Site.find(ids[:site]).to_json
    @response
  end

  def index
    @response.status = 200
    @response.write Site.all.to_json
    @response
  end
end