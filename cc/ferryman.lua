local fill_inv
fill_inv = function()
  for i = 1, 16 do
    turtle.select(i)
    turtle.suck()
  end
end
local dump_inv
dump_inv = function()
  for i = 1, 16 do
    turtle.select(i)
    turtle.dropDown()
  end
end
local running = true
print("Good day to you! I'm ready to ferry your goods between two stations.")
while running do
  if turtle.detect() then
    print("Dumping inventory...")
    dump_inv()
    if turtle.getFuelLevel() < 1000 then
      print("Fuel low, refueling...")
      turtle.suckUp()
      turtle.refuel()
    end
    io.write("Refueled. Fuel level: ")
    print(turtle.getFuelLevel())
    print("Filling inventory...")
    fill_inv()
    turtle.turnLeft()
    turtle.turnLeft()
  end
  print("And I'm off!")
  while not turtle.detect() do
    turtle.forward()
  end
end
