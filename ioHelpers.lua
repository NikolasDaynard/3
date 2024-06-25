function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
  end

function lines_from(file)
if not file_exists(file) then return {} end
local lines = {}
for line in io.lines(file) do 
    lines[#lines + 1] = line
end
return lines
end

function executeLuaCode(code)
  local chunk, err = load(code)
  if chunk then
      local success, result = pcall(chunk)
      if success then
          return result
      else
          return nil, "Execution error: " .. result
      end
  else
      return nil, "Compilation error: " .. err
  end
end