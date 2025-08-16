function draw_anim_state(state, loop, target)
  local current_frame_index = ceil(state.counter / state.frame_duration)
  state.frames[current_frame_index](target)

  local predicted_frame_index = ceil((state.counter + 1) / state.frame_duration)
  if predicted_frame_index > #state.frames then
    if loop then
      state.counter = 1
    end
  else
    state.counter = state.counter + 1
  end
end

function set_entity_anim_state(entity, state_name)
  entity.anim_state = entity.anim_states[state_name]
  entity.anim_state.counter = 1
end

function create_anim_state(frames, frame_duration, loop)
  -- Validations
  assert(frames, "frames cannot be nil")
  assert(type(frames) == "table", "frames must be a table")
  assert(#frames > 0, "frames must be a non-empty list")
  assert(frame_duration == nil or (type(frame_duration) == "number" and frame_duration > 0), "frame_duration must be a positive number")
  assert(loop == nil or type(loop) == "boolean", "loop must be a boolean")

  return {
    counter = 1,
    frame_duration = frame_duration,
    frames = frames,
    loop = loop,
    draw = function(self, target)
      draw_anim_state(self, self.loop, target)
    end
  }
end

function init_entity(x,y,anim_states,initial_anim_state_name)
  local entity = {
    x = x,
    y = y,
    anim_state = anim_states[initial_anim_state_name], -- Set the initial anim state

    draw = function(self)
      self.anim_state:draw(self)
    end,

    set_anim_state = function(self, state_name)
      set_entity_anim_state(self, state_name)
    end,
    anim_states = anim_states,
  }

  return entity
end