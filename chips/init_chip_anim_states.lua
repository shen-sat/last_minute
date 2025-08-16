function init_chip_anim_states()
  local anim_states = {}

  local idle_frames = {
    function (target)
      print_large_number(target.value, target.x, target.y, target.color)
    end
  }
  
  anim_states['idle'] = create_anim_state(idle_frames, 10, false)

  return anim_states
end
