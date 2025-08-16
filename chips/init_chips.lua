function init_chips()
  function shuffle(t)
    for i = #t, 2, -1 do
      local j = flr(rnd(i)) + 1
      t[i], t[j] = t[j], t[i]
    end
  end

  local chips = {}
  for i = 0, 59 do
    if i % 4 == 0 then
      shuffled_colors = {8, 11, 12, 13}
      shuffle(shuffled_colors)
    end
    local color = shuffled_colors[(i % 4) + 1]
    add(chips, init_chip(0, i * 10, color, i))
  end

  return chips
end