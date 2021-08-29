args = {...}

function move(direction,force)
	force = force or false
	if direction == "forward" then
		while not turtle.forward() do
			if force then turtle.dig() end
		end
	elseif direction == "back" then
		while not turtle.back() do
			if force then turtle.turnLeft() turtle.turnLeft() turtle.dig() turtle.turnLeft() turtle.turnLeft() end
		end
	elseif direction == "up" then
		while not turtle.up() do
			if force then turtle.digUp() end
		end
	elseif direction == "down" then
		while not turtle.down() do
			if force then turtle.digDown() end
		end
	end
end

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
				move("forward", true)
			end
			turtle.turnRight()
			turtle.turnRight()
		else
			for i=1,x,1 do
				turtle.dig()
				move("forward", true)
			end
		end
		if z < 0 then
			for i=1,z * -1,1 do
				turtle.digDown()
				move("down", true)
			end
		else
			for i=1,z,1 do
				turtle.digUp()
				move("up", true)
			end
		end
	elseif order == "z" then
		if z < 0 then
			for i=1,z * -1,1 do
				turtle.digDown()
				move("down", true)
			end
		else
			for i=1,z,1 do
				turtle.digUp()
				move("up", true)
			end
		end
		if x < 0 then
			turtle.turnRight()
			turtle.turnRight()
			for i=1,x * -1,1 do
				turtle.dig()
				move("forward", true)
			end
			turtle.turnRight()
			turtle.turnRight()
		else
			for i=1,x,1 do
				turtle.dig()
				move("forward", true)
			end
		end
	else
		print("Third argument must be x or z to indicate which direction to go first")
	end
end
		