class Techlog
  attr_accessor :request

  def initialize(obj)
    @request = obj[:request]
    binding.pry
    to_controller_name(get_controller_name).invoke_action
  end

  def get_controller_name
    useful_path.find_last_word
  end

  def useful_path
    @request.path.split("/")[2..-1]
  end

  def to_controller_name word
    (word.titleize + "Controller").constantize
  end

  def invoke_action
    # Assuming GET for now.
    # Header checks will go here.
    if useful_path.last.is_i?
      self.send "show"
    else
      self.send "index"
    end
  end

end