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
    if line ~= "" then
        line = promptUser(line, lineNum)
    end

    return line
end