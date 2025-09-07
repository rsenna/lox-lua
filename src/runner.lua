---@meta runner

local runner = {}

--- Executes a Lox-Lua script from a file.
--- @param path string The path to the Lox-Lua script file.
--- @returns nothing
function runner.runFile(path)
  local file = io.open(path, "r")

  if not file then
    print("Could not open file: " .. path)
    os.exit(66)
  end

  local source = file:read("*a")
  file:close()

  local success, err = pcall(function() runner.run(source) end)

  if not success then
    print(err)
    os.exit(70)
  end
end

--- Starts an interactive REPL session.
--- @returns nothing
function runner.runInteractive()
  print("Lox Lua REPL. Type ':exit' to quit.")

  while true do
    io.write("> ")
    local line = io.read()

    if line == nil or line:lower() == ":exit" then
      break
    end

    local success, err = pcall(function() runner.run(line) end)

    if not success then
      print(err)
    end
  end
end

--- Executes a Lox-Lua script from a source.
--- @param source string The Lox-Lua source code.
--- @returns nothing
function runner.run(source)
  local chunk, err = load(source, "lox-lua:runner:run", "t", {})

  if not chunk then
    error("Syntax Error: " .. err)
  end

  local success, runtimeErr = pcall(chunk)

  if not success then
    error("Runtime Error: " .. runtimeErr)
  end
end

return runner