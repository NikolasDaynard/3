vars = {}
labels = {}

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

function interpret(bytecode, startingLine)
    readNextLine = true
    for i = startingLine, #bytecode do
        if readNextLine then
            if string.sub(bytecode[i], 1, 3) == "set" then
                parts = splitString(bytecode[i], ":")
                vars[parts[2]] = parts[3]
            elseif string.sub(bytecode[i], 1, 5) == "print" then
                parts = splitString(bytecode[i], ":")
                if vars[parts[2]] ~= nil then
                    print(vars[parts[2]])
                else
                    print(parts[2])
                end
            elseif string.sub(bytecode[i], 1, 4) == "goto" then
                parts = splitString(bytecode[i], ":")
                if vars[parts[2]] ~= nil then
                    interpret(bytecode, vars[parts[2]])
                    return
                end
            elseif string.sub(bytecode[i], 1, 3) == "add" then
                parts = splitString(bytecode[i], ":")
                if vars[parts[2]] ~= nil then
                    vars[parts[2]] = vars[parts[2]] + (tonumber(vars[parts[3]]) or parts[3])
                else    
                    print("operand 1 not var weweoeooeo muy no bueno")
                end
            elseif string.sub(bytecode[i], 1, 3) == "sub" then
                parts = splitString(bytecode[i], ":")
                if vars[parts[2]] ~= nil then
                    vars[parts[2]] = vars[parts[2]] - (tonumber(vars[parts[3]]) or parts[3])
                else    
                    print("operand 1 not var weweoeooeo muy no bueno")
                end
            elseif string.sub(bytecode[i], 1, 3) == "div" then
                parts = splitString(bytecode[i], ":")
                if vars[parts[2]] ~= nil then
                    vars[parts[2]] = vars[parts[2]] / (tonumber(vars[parts[3]]) or parts[3])
                else    
                    print("operand 1 not var weweoeooeo muy no bueno")
                end
            elseif string.sub(bytecode[i], 1, 3) == "mul" then
                parts = splitString(bytecode[i], ":")
                if vars[parts[2]] ~= nil then
                    vars[parts[2]] = vars[parts[2]] * (tonumber(vars[parts[3]]) or parts[3])
                else    
                    print("operand 1 not var weweoeooeo muy no bueno")
                end
            elseif string.sub(bytecode[i], 1, 2) == "if" then
                parts = splitString(bytecode[i], ":")
                if vars[parts[2]] ~= nil then
                    if vars[parts[3]] ~= nil then
                        readNextLine = ((tonumber(vars[parts[2]]) or vars[parts[2]]) == (tonumber(vars[parts[3]]) or vars[parts[3]]))
                    else
                        readNextLine = ((tonumber(vars[parts[2]]) or vars[parts[2]]) == (tonumber(parts[3]) or parts[3]))
                    end
                else    
                    print("operand 1 not var weweoeooeo muy no bueno")
                end
            elseif string.sub(bytecode[i], 1, 3) == "nif" then
                parts = splitString(bytecode[i], ":")
                if vars[parts[2]] ~= nil then
                    if vars[parts[3]] ~= nil then
                        readNextLine = not ((tonumber(vars[parts[2]]) or vars[parts[2]]) == (tonumber(vars[parts[3]]) or vars[parts[3]]))
                    else
                        readNextLine = not ((tonumber(vars[parts[2]]) or vars[parts[2]]) == (tonumber(parts[3]) or parts[3]))
                    end
                else    
                    print("operand 1 not var weweoeooeo muy no bueno")
                end
            elseif string.sub(bytecode[i], 1, 3) == "lua" then
                parts = splitString(bytecode[i], ":")
                executeLuaCode(parts[2])
            end
        else
            readNextLine = true
        end
    end
end