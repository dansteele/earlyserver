class Techlog::UserController < Techlog
  def initialize obj
    super
  end

  def show(ids)
    @response.write User.find(ids[:user]).to_json
    super
  end

  def index
    @response.write({
      "Techlog users" => User.all
    }.to_json)
    super
  end
end