def roll(expr = '1d6', exploding = false)
  rolls, sides = expr.match(/^(\d+)d(\d+)/)[1..2]
  rolls = rolls.to_i
  sides = sides.to_i
  total = 0
  rolls_made = 0
  while rolls_made < rolls do
    rolls_made += 1
    roll = Random.new.rand(sides)+1
    total += roll
    if exploding == true && roll == sides
      rolls += 1
    end
  end
  return total
end
