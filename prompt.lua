function promptUser(line)
    print(line)
    local input = prompt("what is the operation? [Set] [Print] [If]")
    local command = ""
    if input == "Set" then
        command = command .. "set:"
        input = prompt("What was set?")
        command = command .. input .. ":"
        input = prompt("To what?")
        command = command .. input
    elseif input == "Print" then
        command = command .. "print:"
        input = prompt("Print what?")
        command = command .. input
    end
    return command
end
function prompt(question)
    print(question)
    local input = io.read()
    return(input)
end