local function range(from, to, step)
  local t = {}
  local argType = type(from)
  step = step or 1
  
  if argType == "number" then
    for i = from, to, step do t[#t + 1] = i end
  elseif argType == "string" then
    local e = to:byte()
    for i = from:byte(), e, step do t[#t + 1] = string.char(i) end
  elseif argType == "table" then
    local metaNext = getmetatable(from).__next
    
    if metaNext then
      local i = from
      
      while i < to do
        t[#t + 1] = i
        i = metaNext(i, step)
      end
      
      t[#t + 1] = to
    end
  end
  
  return t
end

return range
