require("prompt")

--[[
    Stuff is encoded like this
    line[lineNum] = "command"
    command is simple like add or the subtrack
]]--
function containsOperand(line) 
    return string.find(line, "=") ~= nil
end

function encode(line, lineNum)
    line = promptUser(line, lineNum)

    return line
end