class SiteController < Techlog
  def initialize obj
    super
  end

  def show(ids)
    super
    @response.status = 200
    @response.write User.find(ids[:site]).to_json
  end

  def index
    super
    @response.status = 200
    @response.write User.all.to_json
  end
end