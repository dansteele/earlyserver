class Array
  def find_last_word
    self.reject {|item| !!(item =~ /\A[-+]?[0-9]+\z/) }.first
  end
end