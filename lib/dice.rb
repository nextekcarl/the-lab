def roll(expr = '1d6')
  rolls, sides = expr.match(/^(\d+)d(\d+)/)[1..2]
  rolls = rolls.to_i
  sides = sides.to_i
  total = 0
  rolls.times do
    total += Random.new.rand(sides)+1
  end
  return total
end
