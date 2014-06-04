require 'digest'

class Player
  attr_reader :name, :id
  def initialize(name, college="")
    @name = name
    @id = ::Digest::MD5::hexdigest(@name)
    @college = college
  end

  def to_h
    { name: @name, id: @id, college: @college }
  end

  def to_json(*a)
    to_h.to_json
  end
end

