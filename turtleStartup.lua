if os.getComputerLabel() == nil then
    os.setComputerLabel("New Turtle")
end
print("Hello World, "..os.getComputerLabel().." here!")
os.loadAPI("include.lua")
print("Loaded includes.")