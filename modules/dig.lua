function digFront()
    turtle.dig()
	turtle.suck()
end

function digUp()
	turtle.dig()
	turtle.suckUp()
end

function digDown()
	turlte.digDown()
	turtle.suckDown()
end

function digUpDown()
    digUp()
	digDown()
end

function digLeftRight()
	turtle.turnLeft(1)
	digFront()
	turtle.aboutFace()
	digFront()
	turtle.turnLeft(1)
end

function frontUpDown()
    digFront()
    digUpDown()
end
