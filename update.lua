--Get location to update to
loc = "/"
if fs.exists("/disk/") then
	loc = "/disk/"
end

--Cleanup
shell.execute("rm",loc.."*")

--Modules from github
print("Getting modules...")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/modules/move.lua", loc.."modules/move.lua")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/modules/dump.lua", loc.."modules/dump.lua")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/modules/echo.lua", loc.."modules/echo.lua")

--Programs from github
print("Getting programs...")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/programs/dig16x16x-6.lua", "/disk/programs/dig16x16x-6.lua")


--Root dir from github
print("Getting root files...")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/updater.lua", loc.."updater.lua")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/.settings", loc..".settings")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/include.lua", loc.."include.lua")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/startup.lua", loc.."startup.lua")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/turtleStartup.lua", loc.."turtleStartup.lua")

