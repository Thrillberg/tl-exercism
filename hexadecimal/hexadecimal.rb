class Hexadecimal
  def initialize(hex)
    @hex = hex
  end

  def hex_hash(hex)
    if hex.to_i != 0
      hex
    else
      base_ten = (10..16).to_a
      base_sixteen = ("a".."g").to_a
      Hash[base_sixteen.zip(base_ten)][hex]
    end
  end

  def to_decimal
    hex_array = @hex.split('').to_a.reverse
    if /[h-z]/.match hex_array.join(' ')
      0
    else
      final_array = []
      hex_array.each_with_index do |value, index|
        final_array << hex_hash(value.downcase).to_i * 16 ** index
      end
      final_array.inject(:+)
    end
  end
end

#hex = Hexadecimal.new("7DE").to_decimal
#puts hex