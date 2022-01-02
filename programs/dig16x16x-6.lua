os.loadAPI("include.lua")

local dumpPos = vector.new(0,0,0)
local refuelPos = vector.new(0,0,0)
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
	move.goTo(dumpPos)
	dump.slotsDown(1,16)
	

local function doRefuel()
	doDump()
	move.goTo(refuelPos)
	turtle.select(16)
	while turtle.getItemCount < 32 do
		turtle.dropDown()
		turtle.suckDown()
	end
	turtle.refuel(64)
end

local function main()
	for i=1,2 do
		for i=1,8 do
			if isFull()
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
			prevPos = gps.locate()
			prevFacing = move.facing
			doRefuel()
			move.goTo(prevPos())
			move.faceDir(prevFacing)
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