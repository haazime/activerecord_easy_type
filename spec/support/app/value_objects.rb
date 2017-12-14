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

Age = Struct.new(:birth) do
  def self.from_birth(date)
    new(date)
  end

  def self.from_date(date)
    from_birth(date)
  end

  def to_date
    birth
  end
end

Rank = Struct.new(:joined_at) do
  def self.from_joined_at(joined_at)
    new(joined_at)
  end

  def self.from_datetime(datetime)
    from_joined_at(datetime)
  end

  def to_datetime
    joined_at
  end
end
