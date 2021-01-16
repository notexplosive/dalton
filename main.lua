local player
local coins

function calculateDistance(pointA, pointB)
    local diffx, diffy = pointA.x - pointB.x, pointA.y - pointB.y
    local distanceSquared = diffx * diffx + diffy * diffy
    return math.sqrt(distanceSquared)
end

function drawPlayer(player)
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", player.x, player.y, player.size)
end

function updatePlayer(player, dt)
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
end

function drawCoin(coin)
    love.graphics.setColor(1, 1, 0.5)
    love.graphics.circle("fill", coin.x, coin.y, coin.size)
end

function love.load()
    player = {
        x = 100,
        y = 100,
        velocity = {x = 0, y = 0},
        speed = 240,
        size = 10,
        draw = drawPlayer,
        update = updatePlayer
    }

    coins = {
        {
            x = 500,
            y = 300,
            size = 5,
            draw = drawCoin
        },
        {
            x = 500,
            y = 300,
            size = 5,
            draw = drawCoin
        },
        {
            x = 100,
            y = 200,
            size = 5,
            draw = drawCoin
        },
        {
            x = 300,
            y = 600,
            size = 5,
            draw = drawCoin
        }
    }
end

function love.update(dt)
    player.update(player, dt)

    -- coins logic (if coin exists)
    for i in pairs(coins) do
        local coin = coins[i]
        if calculateDistance(player, coin) < coin.size + player.size then
            -- destroy coin, remove from list
            table.remove(coins, i)

            -- grow from eating a coin
            player.size = player.size + coin.size
        end
    end
end

function love.draw()
    -- draw player
    player.draw(player)

    -- draw coins if it exists
    for i in pairs(coins) do
        local coin = coins[i]
        coin.draw(coin)
    end
end
