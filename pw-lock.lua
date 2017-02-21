term.clear()
term.setCursorPos(1, 1)
os.setComputerLabel("cargo_bay_term")
os.pullEvent = os.pullEventRaw
redstone.setOutput("right", true)
local turtle_locked = true
local toggle_lights
toggle_lights = function()
  if redstone.getOutput("back") then
    return redstone.setOutput("back", false)
  else
    return redstone.setOutput("back", true)
  end
end
local check_pass
check_pass = function()
  io.write("ENTER PASSCODE: ")
  local pass = read("*")
  if pass == "12345" then
    return true
  end
end
local unlock
unlock = function()
  if check_pass() then
    print("ACCESS GRANTED, GATE UNLOCKED")
    redstone.setOutput("right", false)
    turtle_locked = false
  else
    return print("ACCESS DENIED")
  end
end
local lock
lock = function()
  print("LOCKING GATE")
  redstone.setOutput("right", true)
  turtle_locked = true
end
local running = true
local lights_on = false
print("CARGO BAY TERMINAL")
while running do
  io.write("> ")
  local input = io.read()
  if input == "unlock" then
    unlock()
  elseif input == "lock" then
    lock()
  elseif input == "lights" then
    toggle_lights()
  elseif input == "exit" then
    if check_pass() then
      print("EXITING")
      running = false
    else
      print("ACCESS DENIED")
    end
  else
    print("INVALID")
  end
end
