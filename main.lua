function love.load()
	theta = 0
	omega = 2
	radius = 100
	order = 3
end

function love.update( dt )
	theta = theta + omega * dt
end

function harmonic( x1, y1, n )
    local n = n or 1
    local m = 2 * n - 1
    local r = radius / m
    local x2 = x1 + ( r * math.cos( -m * theta ))
    local y2 = y1 + ( r * math.sin( -m * theta ))
    love.graphics.print( string.format( '%f %d', theta, order ), 20, 20 )
    love.graphics.circle( 'line', x1, y1, r )
    love.graphics.line( x1, y1, x2, y2 )
    if n <  order then
        harmonic( x2, y2, n+1 )
    else
        love.graphics.line( x2, y2, 600, y2 )
    end
end

function love.draw()
    harmonic( 200, 300 )    
end

function love.keypressed( key, unicode )

	print( key, unicode )

	if     key == "escape" then love.event.quit()
	elseif key == 'f1' then radius = radius + 10
	elseif key == 'f2' then radius = radius - 10
	elseif key == 'f3' then order = order + 1
	elseif key == 'f4' then order = order - 1
	end

end


