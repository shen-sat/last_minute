function print_large_number(num, x, y, color)
  color = color or 7 -- Default to white
  
  -- Define large digit patterns (6x10 pixels each)
  -- Each digit is exactly 6 pixels wide, based on PICO-8's blocky font
  -- 'x' = pixel, ' ' = empty space
  local digits = {
    ['0'] = {
      "xxxxxx",
      "xxxxxx",
      "xx  xx",
      "xx  xx",
      "xx  xx",
      "xx  xx",
      "xx  xx",
      "xx  xx",
      "xxxxxx",
      "xxxxxx"
    },
    ['1'] = {
      "xxxx  ",
      "xxxx  ",
      "  xx  ",
      "  xx  ",
      "  xx  ",
      "  xx  ",
      "  xx  ",
      "  xx  ",
      "xxxxxx",
      "xxxxxx"
    },
    ['2'] = {
      "xxxxxx",
      "xxxxxx",
      "    xx",
      "    xx",
      "xxxxxx",
      "xxxxxx",
      "xx    ",
      "xx    ",
      "xxxxxx",
      "xxxxxx"
    },
    ['3'] = {
      "xxxxxx",
      "xxxxxx",
      "    xx",
      "    xx",
      "xxxxxx",
      "xxxxxx",
      "    xx",
      "    xx",
      "xxxxxx",
      "xxxxxx"
    },
    ['4'] = {
      "xx  xx",
      "xx  xx",
      "xx  xx",
      "xx  xx",
      "xxxxxx",
      "xxxxxx",
      "    xx",
      "    xx",
      "    xx",
      "    xx"
    },
    ['5'] = {
      "xxxxxx",
      "xxxxxx",
      "xx    ",
      "xx    ",
      "xxxxxx",
      "xxxxxx",
      "    xx",
      "    xx",
      "xxxxxx",
      "xxxxxx"
    },
    ['6'] = {
      "xxxxxx",
      "xxxxxx",
      "xx    ",
      "xx    ",
      "xxxxxx",
      "xxxxxx",
      "xx  xx",
      "xx  xx",
      "xxxxxx",
      "xxxxxx"
    },
    ['7'] = {
      "xxxxxx",
      "xxxxxx",
      "    xx",
      "    xx",
      "    xx",
      "    xx",
      "    xx",
      "    xx",
      "    xx",
      "    xx"
    },
    ['8'] = {
      "xxxxxx",
      "xxxxxx",
      "xx  xx",
      "xx  xx",
      "xxxxxx",
      "xxxxxx",
      "xx  xx",
      "xx  xx",
      "xxxxxx",
      "xxxxxx"
    },
    ['9'] = {
      "xxxxxx",
      "xxxxxx",
      "xx  xx",
      "xx  xx",
      "xxxxxx",
      "xxxxxx",
      "    xx",
      "    xx",
      "xxxxxx",
      "xxxxxx"
    }
  }
  
  local num_str = tostr(num)
  local current_x = x
  
  -- Draw each digit
  for i = 1, #num_str do
    local digit = sub(num_str, i, i)
    local pattern = digits[digit]
    
    if pattern then
      -- Draw the digit pattern (exactly 6x10 pixels)
      for row = 1, 10 do
        local line = pattern[row]
        for col = 1, 6 do
          local char = sub(line, col, col)
          if char == 'x' then
            pset(current_x + col - 1, y + row - 1, color)
          end
        end
      end
    end
    
    -- Move to next digit position (6 pixels + 1 pixel spacing)
    current_x += 7
  end
end