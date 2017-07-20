PersonName = Struct.new(:first_name, :last_name) do
  def self.from_string(string)
    new(*string.split(' '))
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end

Height = Struct.new(:in_centimeter) do
  def self.from_integer(integer)
    new(integer)
  end

  def to_i
    in_centimeter
  end
end
