function init_chip_anim_states()
  local anim_states = {}

  local idle_frames = {
    function (target)
      pal(12, target.color)
      -- if chip is orange, change the hole color to yellow
      if target.color == 9 then
        pal(9,10)
      end
      sspr(0,0,23,16,target.x,target.y)
      pal()
      print_large_number(target.value, target.x + 3, target.y + 2, 2)
    end
  }
  
  anim_states['idle'] = create_anim_state(idle_frames, 10, false)

  return anim_states
end
