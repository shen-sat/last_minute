function init_hand(x,y,chips)
  local hand = {
    x = x,
    y = y,
    chips = {},
    update = function(self)
      for i = 1, #self.chips do
        local chip = self.chips[i]
        --TODO: if chip is selected, then skip setting position, as it will be handled by cursor/its own state
        chip.x = self.x
        chip.y = self.y + (i * 14) - 14
      end
    end,
    draw = function(self)
      for chip in all(self.chips) do
        chip:draw()
      end
    end
  }
  
  for i = 1, 7 do
    local index = flr(rnd(#chips)) + 1
    local chip = chips[index]
    add(hand.chips, chip)
    del(chips, chip)
  end

  return hand
end

