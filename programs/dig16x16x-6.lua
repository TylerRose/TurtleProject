os.loadAPI("include.lua")

--Vars to put in config file
--local dumpPos = vector.new(0,0,0)
--local refuelPos = vector.new(0,0,0)
--local flyHeight = 0
local prevPos = vector.new(0,0,0)
local prevFacing = ""

local function isFull()
	turtle.select(16)
	if turtle.getItemCount() then
		return true
	else
		return false
	end
end

local function doDump()
	pposSave = prevPos
	prevPos = vector.new(gps.locate())
	prevFacing = move.facing
	move.moveTo(conf.dumpPos,conf.flyHeight)
	dump.slotsDown(1,16)
	move.moveTo(prevPos,conf.flyHeight)
	move.faceDir(prevFacing)
	prevPos = pposSave
end

local function doRefuel()
	pposSave = prevPos
	prevPos = vector.new(gps.locate())
	doDump()
	move.moveTo(conf.refuelPos,conf.flyHeight)
	turtle.select(16)
	while turtle.getItemCount < 32 do
		turtle.dropDown()
		turtle.suckDown()
	end
	turtle.refuel(64)
	move.moveTo(prevPos,conf.flyHeight)
	move.faceDir(prevFacing)
	prevPos = pposSave
end

local function main()
	for i=1,2 do
		for j=1,8 do
			if isFull() then
				print("Inventory Full")
				doDump()
			end
			print("Starting new row")
			move.forwardTall(16,true)
			move.uTurnRight(true)
			move.digUpDown()
			if isFull() then
				print("Inventory Full")
				doDump()
			end
			print("Starting new row")
			move.forwardTall(16,true)
			move.uTurnLeft(true)
		end
		if turtle.getFuelLevel() < 64 then
			print("Refueling")
			doRefuel()
		end
		print("Starting new Layer")
		move.turnLeft(1)
		move.forward(16,true)
		move.turnRight(1)
		move.down(3,true)
		move.backward(1,true)
	end
end

main()