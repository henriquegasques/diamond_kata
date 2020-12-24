class Diamond
  attr_reader :separator

  def initialize
    @separator = "_"
  end

  def build(character)
    return "A\n" if character == 'A'

    diamond_base, separator_quantity = build_diamond_base(character)
    top_to_middle = centralize(diamond_base, separator_quantity)

    _middle_line, *bottom_lines = top_to_middle.reverse.lines
    top_to_middle + "\n" + bottom_lines.join + "\n"
  end

  private

  def build_diamond_base(character)
    'B'.upto(character).reduce(["A", 1]) do |(diamond, separator_quantity), letter|
      new_diamond = diamond + "\n" + letter + (separator * separator_quantity) + letter

      [new_diamond, separator_quantity + 2]
    end
  end

  def centralize(diamond_base, separator_quantity)
    diamond_base.lines.map do |diamond_line|
      diamond_line.chomp.center(separator_quantity, separator)
    end.join("\n")
  end
end
