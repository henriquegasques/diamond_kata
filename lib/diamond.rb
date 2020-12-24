class Diamond

  def build(character)
    return "A\n" if character == 'A'

    diamond, underscores = 'B'.upto(character).reduce(["A", 1]) do |(diamond, underscores), letter|
      new_diamond = diamond + "\n" + letter + ("_" * underscores) + letter

      [new_diamond, underscores + 2]
    end

    diamond = diamond.each_line.map.with_index do |diamond_line, index|
      index == diamond.lines.count - 1 ? diamond_line : diamond_line.chomp.center(underscores, "_")
    end.join("\n")

    _middle, *diamond_bottom = diamond.reverse.lines
    diamond + "\n" + diamond_bottom.join + "\n"
  end
end
