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
	prevPos = gps.locate()
	prevFacing = move.facing
	move.goTo(conf.dumpPos,conf.flyHeight)
	dump.slotsDown(1,16)
	move.goTo(prevPos,conf.flyHeight)
	move.faceDir(prevFacing)
	prevPos = pposSave
end

local function doRefuel()
	pposSave = prevPos
	prevPos = gps.locate()
	doDump()
	move.goTo(conf.refuelPos,conf.flyHeight)
	turtle.select(16)
	while turtle.getItemCount < 32 do
		turtle.dropDown()
		turtle.suckDown()
	end
	turtle.refuel(64)
	move.goTo(prevPos,conf.flyHeight)
	move.faceDir(prevFacing)
	prevPos = pposSave
end

local function main()
	for i=1,2 do
		for j=1,8 do
			if isFull() then
				doDump()
			end
			print("Starting new row")
			move.forwardTall(16,true)
			move.uTurnRight(true)
			move.digUpDown()
			if isFull() then
				doDump()
			end
			print("Starting new row")
			move.forwardTall(16,true)
			move.uTurnLeft(true)
		end
		if turtle.getFuelLevel() < 64 then
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