vars = {}

function splitString(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    local n = 1
    while true do
        local i, j = string.find(inputstr, sep, n)
        if not i then
            table.insert(t, string.sub(inputstr, n))
            break
        end
        table.insert(t, string.sub(inputstr, n, i - 1))
        n = j + 1
    end
    return t
end

function interpret(bytecode)
    for i = 1, #bytecode do
        if string.sub(bytecode[i], 1, 3) == "set" then
            parts = splitString(bytecode[i], ":")
            vars[parts[2]] = parts[3]
            -- print("setting, " .. parts[2])
            -- print("to, " .. parts[3])
        elseif string.sub(bytecode[i], 1, 5) == "print" then
            parts = splitString(bytecode[i], ":")
            if vars[parts[2]] ~= nil then
                print(vars[parts[2]])
            else
                print(parts[2])
            end
        end
    end
end