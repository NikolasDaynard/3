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
                    vars[parts[2]] = vars[parts[2]] + parts[3]
                else    
                    print("operand 1 not var weweoeooeo muy no bueno")
                end
            elseif string.sub(bytecode[i], 1, 2) == "if" then
                parts = splitString(bytecode[i], ":")
                if vars[parts[2]] ~= nil then
                    readNextLine = vars[parts[2]] == parts[3]
                else    
                    print("operand 1 not var weweoeooeo muy no bueno")
                end
            elseif string.sub(bytecode[i], 1, 3) == "nif" then
                parts = splitString(bytecode[i], ":")
                print("notif")
                print(vars[parts[2]])
                print(tonumber(parts[3]) or parts[3])
                if vars[parts[2]] ~= nil then
                    readNextLine = not (vars[parts[2]] == (tonumber(parts[3]) or parts[3]))
                    if readNextLine then
                        print("contine")
                    else
                        print("sad")
                    end
                else    
                    print("operand 1 not var weweoeooeo muy no bueno")
                end
            end
        else
            readNextLine = true
        end
    end
end