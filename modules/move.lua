--Turning functions--

facing = "north"
local dirs = {"north", "east", "south", "west"}
local facingNum = 1

function turnLeft(a)
	if a == nil then
		a = 1
	end
    for i=1,a do
        turtle.turnLeft()
		facingNum = facingNum - 1
		if facingNum == 0 then
			facingNum = 4
		end
		facing = dirs[facingNum]
    end
	facing = dirs[facingNum]
	print("Now Facing " .. facing)
end

function turnRight(a)
	if a == nil then
		a = 1
	end
    for i=1,a do
        turtle.turnRight()
				facingNum = facingNum + 1
		if facingNum == 5 then
			facingNum = 1		
		end
		facing = dirs[facingNum]
    end
	print("Now Facing " .. facing)
end

function aboutFace()
    turnLeft(2)
end

--Moving Functions--
function forward(a, doDig)
	if a >= 0 then
		for i=1,a do
			while not turtle.forward() do
				if doDig then
					blocked, meta = turtle.inspect()
					while meta.name == "computercraft:turtle_advanced" do 
						print("Avoiding Friendly Fire")
					end
					dig.digFront()
					forward(1,false)
				end
			end
		end
	else
		backward(a*-1)
	end
end

function forwardTall(a)
	for i=1,a do
		forward(1,true)
		blocked, meta = turtle.inspectUp()
		while meta.name == "computercraft:turtle_advanced" do 
			print("Avoiding Friendly Fire")
		end
		blocked, meta = turtle.inspectDown()
		while meta.name == "computercraft:turtle_advanced" do 
			print("Avoiding Friendly Fire")
		end
		dig.digUpDown()
	end
end

function forwardWide(a)
	for i=1,a do
		forward(1,true)
		turnLeft(1)
		blocked, meta = turtle.inspect()
		while meta.name == "computercraft:turtle_advanced" do 
			print("Avoiding Friendly Fire")
		end
		aboutFace()
		blocked, meta = turtle.inspect()
		while meta.name == "computercraft:turtle_advanced" do 
			print("Avoiding Friendly Fire")
		end
		turnLeft(1)
		dig.digLeftRight()
	end
end

function backward(a, doDig)
	if a >= 0 then
		aboutFace()
		forward(a,doDig)
		aboutFace()
	else
		forward(a*-1)
	end
end

function up(a, doDig)
    for i=1,a do
        if not turtle.up() then
            if doDig then
				blocked, meta = turtle.inspectUp()
				while meta.name == "computercraft:turtle_advanced" do 
					print("Avoiding Friendly Fire")
				end
                dig.digUp()
                up(1, false)
            else
                return false
            end
        end
    end
end         

function down(a, doDig)
    for i=1,a do
        if not turtle.down() then
            if doDig then
				blocked, meta = turtle.inspect()
				while meta.name == "computercraft:turtle_advanced" do 
					print("Avoiding Friendly Fire")
				end
                dig.digFront()
                down(1,false)
            else
                return false
            end
        end
    end
end

-- Compound turn functions
function moveLeft(a, doDig)
    turnLeft(1)
    forward(a, doDig)
    turnRight(1)
end

function uTurnLeft(doDig)
    turnLeft(1)
    forward(1,doDig)
    turnLeft(1)
end

function moveRight(a, doDig)
    turnRight(1)
    forward(a, doDig)
    turnLeft(1)
end

function uTurnRight(doDig)
    turnRight(1)
    forward(1,doDig)
    turnRight(1)
end

function faceDir(direction)
	print("Turning to: "..direction.." - current: "..facing)
	turnCount = 0
	while not (direction == facing) do
		turnRight(1)
		turnCount = turnCount + 1		
		if turnCount == 5 then
			direction = nil
		end
	end
end

--Complex move functions

function moveTo(newPos, flyHeight)
	saveFacing = facing
	currentPos = vector.new(gps.locate())
	print("Moving to: "..newPos:tostring() .. " - current: "..currentPos:tostring())
	path = newPos - currentPos
	print("Moving along "..path.x.." "..path.y.." "..path.z)
	fuelRequired = path.x + path.y + path.z + flyHeight
	while turtle.getFuelLevel() < fuelRequired do
		print("ERROR: No fuel to refuel!")
		for i=1, 16 do
			turtle.select(i)
			turtle.refuel(64)
		end
		turtle.select(1)
		aboutFace()
		aboutFace()
	end
	up(flyHeight-currentPos.y, true)
	faceDir("north")
	forward(-path.z,true)
	faceDir("east")
	forward(path.x, true)
	down(flyHeight-currentPos.y-path.y, true)
	faceDir(saveFacing)
end