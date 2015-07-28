class UserController < Techlog
  def initialize obj
    super
  end

  def show(ids)
    @response.write User.find(ids[:site]).to_json
    super
  end

  def index
    @response.write User.all.to_json
    super
  end
end