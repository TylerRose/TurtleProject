--Cleanup
shell.execute("rm","/disk/*")

--Modules from github
print("Getting modules...")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/modules/move.lua", "/disk/modules/move.lua")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/modules/dump.lua", "/disk/modules/dump.lua")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/modules/echo.lua", "/disk/modules/echo.lua")

--Programs from github
print("Getting programs...")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/programs/dig16x16x-6.lua", "/disk/programs/dig16x16x-6.lua")


--Root dir from github
print("Getting root files...")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/updater.lua", "/disk/updater.lua")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/.settings", "/disk/.settings")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/include.lua", "/disk/include.lua")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/startup.lua", "/disk/startup.lua")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/turtleStartup.lua", "/disk/turtleStartup.lua")

