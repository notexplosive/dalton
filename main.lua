local player
local coin

function love.load()
    player = {
        x = 100,
        y = 100,
        velocity = {x = 0, y = 0},
        speed = 240,
        size = 10
    }

    coin = {
        x = 500,
        y = 300,
        size = 5
    }
end

function love.update(dt)
    -- set player velocity based on input
    player.velocity.x = 0
    player.velocity.y = 0

    if love.keyboard.isDown("right") then
        player.velocity.x = player.velocity.x + 1
    end

    if love.keyboard.isDown("left") then
        player.velocity.x = player.velocity.x - 1
    end

    if love.keyboard.isDown("up") then
        player.velocity.y = player.velocity.y - 1
    end

    if love.keyboard.isDown("down") then
        player.velocity.y = player.velocity.y + 1
    end

    -- move player by velocity
    player.x = player.x + player.velocity.x * player.speed * dt
    player.y = player.y + player.velocity.y * player.speed * dt

    -- coin logic (if coin exists)
    if coin ~= nil then
        -- calculate distance from player to coin
        local diffx, diffy = coin.x - player.x, coin.y - player.y
        local distanceSquared = diffx * diffx + diffy * diffy
        local distance = math.sqrt(distanceSquared)

        if distance < coin.size + player.size then
            -- destroy coin
            coin = nil
        end
    end
end

function love.draw()
    -- draw player
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", player.x, player.y, player.size)

    -- draw coin if it exists
    if coin ~= nil then
        love.graphics.setColor(1, 1, 0.5)
        love.graphics.circle("fill", coin.x, coin.y, coin.size)
    end
end
