function init_chip(x,y,color,value)
  local anim_states = init_chip_anim_states()
  local chip = init_entity(x,y,anim_states,'idle')
  chip.color = color
  chip.value = value

  return chip
end