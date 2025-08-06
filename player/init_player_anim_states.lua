function init_player_anim_states()
  local player_anim_states = {}

  local player_idle_frames = {
    function (target)
      print("this", target.x, target.y)
    end,
    function (target)
      print("is", target.x, target.y)
    end,
    function (target)
      print("idle...", target.x, target.y)
    end,
  }
  player_anim_states['idle'] = create_anim_state(player_idle_frames, 10, false)

  local player_hurt_frames = {
    function (target)
      print("I", target.x, target.y)
    end,
    function (target)
      print("am", target.x, target.y)
    end,
    function (target)
      print("hurt!", target.x, target.y)
    end
  }
  player_anim_states['hurt'] = create_anim_state(player_hurt_frames, 10, true)

  return player_anim_states 
end
