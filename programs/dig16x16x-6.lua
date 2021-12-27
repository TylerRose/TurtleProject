for i=1,2 do
	for i=1,8 do
		move.forwardTall(16,true)
		move.uTurnRight(true)
		move.digUpDown()
		move.forwardTall(16,true)
		move.uTurnLeft(true)
	end
	move.turnLeft(1)
	move.forward(16,false)
	move.turnRight(1)
	move.down(3,true)
end
