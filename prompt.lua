function promptUser(line, lineNum)
    print(lineNum .. ": " .. line)
    local input = prompt("what is the operation? [Set] [Print] [If] [Goto] [Add] [NIf]")
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
    elseif input == "Goto" then
        command = command .. "goto:"
        input = prompt("What label?")
        command = command .. input
    elseif input == "Add" then
        command = command .. "add:"
        input = prompt("What is being added to?")
        command = command .. input .. ":"
        input = prompt("What is it aded by?")
        command = command .. input
    elseif input == "If" then
        command = command .. "if:"
        input = prompt("What is the variable")
        command = command .. input .. ":"
        input = prompt("What should it equal")
        command = command .. input
    elseif input == "NIf" then
        command = command .. "nif:"
        input = prompt("What is the variable")
        command = command .. input .. ":"
        input = prompt("What NOT should it equal")
        command = command .. input
    else
        print("COMMAND NOT RECOGNISED ABORTINGH")
        return
    end
    return command
end
function prompt(question)
    print(question)
    local input = io.read()
    return(input)
end