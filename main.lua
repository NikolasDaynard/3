require("ioHelpers")
require("bytecode")
require("interpret")

if arg[1] == nil then
    print("No input provided, aborting")
    return
end

local file = arg[1]
local lines = lines_from(file)
local bytecode = {}

if string.find(arg[1], ".byte") then
    interpret(lines, 1)
else
    for k,line in pairs(lines) do
        table.insert(bytecode, encode(line, k))
    end

    for i = 1, #bytecode do
        print(bytecode[i])
    end

    interpret(bytecode, 1)
end