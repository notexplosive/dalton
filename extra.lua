function calculateDistance(pointA, pointB)
    local diffx, diffy = pointA.x - pointB.x, pointA.y - pointB.y
    local distanceSquared = diffx * diffx + diffy * diffy
    return math.sqrt(distanceSquared)
end

function drawPlayer(player)
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", player.x, player.y, player.size)
end

function drawCoin(coin)
    love.graphics.setColor(1, 1, 0.5)
    love.graphics.circle("fill", coin.x, coin.y, coin.size)
end

function drawEnemy(actor)
    love.graphics.setColor(1, 0.5, 0.5)
    love.graphics.circle("fill", actor.x, actor.y, actor.size)
end

function updateCoin(actor, i, dt)
    local player = getFirstActorWithTag("player")
    if calculateDistance(player, actor) < actor.size + player.size then
        -- destroy actor, remove from list
        table.remove(actors, i)

        -- grow from eating a actor
        player.size = player.size + actor.size
    end
end

function updateEnemy(actor, i, dt)
    local player = getFirstActorWithTag("player")
    if calculateDistance(player, actor) < actor.size + player.size then
        -- destroy actor, remove from list
        table.remove(actors, i)

        -- grow from eating a actor
        player.size = player.size - actor.size
    end
end

function updatePlayer(player, i, dt)
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

function getFirstActorWithTag(tag)
    for i in pairs(actors) do
        local actor = actors[i]
        if actor.tags ~= nil then
            for i, currentTag in ipairs(actor.tags) do
                if currentTag == tag then
                    return actor
                end
            end
        end
    end
end
