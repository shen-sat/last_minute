pico-8 cartridge // http://www.pico-8.com
version 36
__lua__

#include draw_number.lua
#include shared.lua
#include chips/init_chip_anim_states.lua
#include chips/init_chip.lua
#include chips/init_chips.lua
#include player/init_player_anim_states.lua
#include player/init_player.lua

function _init()
  player_anim_states = init_player_anim_states()
  player = init_player(64,64,player_anim_states, 'idle')

  chips = init_chips()
end

function _update()
  if btnp(2) then -- Up key pressed
    player:set_anim_state('idle')
  end
  
  if btnp(3) then -- Down key pressed
    player:set_anim_state('hurt')
  end
end

function _draw()
  cls()
  player:draw()
  for chip in all(chips) do
    chip:draw()
  end
end
