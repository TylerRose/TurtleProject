--Get location to update to
loc = "/"
if fs.exists("/disk/") then
	loc = "/disk/"
end

--Cleanup
shell.execute("rm",loc.."programs/")
shell.execute("rm",loc.."modules/")
if loc == "/disk/" then
	shell.execute("rm",loc..".settings")
	shell.execute("rm",loc.."turtleStartup.lua")
end
shell.execute("rm",loc.."include.lua")
shell.execute("rm",loc.."startup.lua")
shell.execute("rm","/startup.lua")


--Modules from github
print("Getting modules...")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/modules/move.lua", loc.."modules/move.lua")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/modules/dump.lua", loc.."modules/dump.lua")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/modules/echo.lua", loc.."modules/echo.lua")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/modules/dig.lua", loc.."modules/dig.lua")

--Programs from github
print("Getting programs...")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/programs/dig16x16x-6.lua", loc.."programs/dig16x16x-6.lua")

--Config templates/defaults if they don't exist
if not fs.exists("/config/digVars.lua") then
	shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/config/digVars.lua", "/config/digVars.lua")
end

--Root dir from github
print("Getting root files...")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/updater.lua", loc.."updater.lua")
if loc == "/disk/" then
	shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/updater.lua", "/disk/updater.lua")
end

shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/.settings", loc..".settings")
shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/include.lua", loc.."include.lua")

--Handle startup for each loc
if loc == "/disk/" then
	print("Updating with disk attached...")
	shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/turtleStartup.lua", loc.."turtleStartup.lua")
	shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/startup.lua", loc.."startup.lua")
else
	print("Updating without disk attached...")
	shell.execute("wget", "https://raw.githubusercontent.com/TylerRose/TurtleProject/main/turtleStartup.lua", loc.."startup.lua")
end