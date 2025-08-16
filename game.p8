pico-8 cartridge // http://www.pico-8.com
version 36
__lua__

#include draw_number.lua
#include shared.lua
#include player/init_player_anim_states.lua
#include player/init_player.lua

function _init()
  player_anim_states = init_player_anim_states()
  player = init_player(player_anim_states, 'idle')
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

  print_large_number(42, 10, 50, 8)     -- Red number at (10, 50)
  print_large_number(12, 0, 0, 11)  -- Green number at (10, 70)
end
