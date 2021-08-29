args = {...}
if table.getn(args) < 2 or table.getn(args) > 3 then
	print("Usage: move X Z order[optional]")
else
	x = tonumber(args[1])
	z = tonumber(args[2])
	order = args[3]
	if order == nil or order == "x" then
		if x < 0 then
			turtle.turnRight()
			turtle.turnRight()
			for i=1,x * -1,1 do
				turtle.dig()
				turtle.forward()
			end
			turtle.turnRight()
			turtle.turnRight()
		else
			for i=1,x,1 do
				turtle.dig()
				turtle.forward()
			end
		end
		if y < 0 then
			for i=1,y * -1,1 do
				turtle.digDown()
				turtle.down()
			end
		else
			for i=1,y,1 do
				turtle.digUp()
				turtle.up()
			end
		end
	elseif order == "z" then
		if y < 0 then
			for i=1,y * -1,1 do
				turtle.digDown()
				turtle.down()
			end
		else
			for i=1,y,1 do
				turtle.digUp()
				turtle.up()
			end
		end
		if x < 0 then
			turtle.turnRight()
			turtle.turnRight()
			for i=1,x * -1,1 do
				turtle.dig()
				turtle.forward()
			end
			turtle.turnRight()
			turtle.turnRight()
		else
			for i=1,x,1 do
				turtle.dig()
				turtle.forward()
			end
		end
	else
		print("Third argument must be x or z to indicate which direction to go first")
	end
end
		