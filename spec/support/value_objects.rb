PersonName = Struct.new(:first_name, :last_name) do
  def self.from_string(string)
    new(*string.split(' '))
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end
