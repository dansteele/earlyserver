class Techlog
  attr_accessor :request

  def initialize(request)
    @request = request
  end


  def parse
    @request.path.split("/").slice(2)
  end
end