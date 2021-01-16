actors = nil
require "extra"

function love.load()
    actors = {
        {
            -- Players
            x = 100,
            y = 100,
            velocity = {x = 0, y = 0},
            speed = 240,
            size = 10,
            draw = drawPlayer,
            update = updatePlayer,
            tags = {"player"}
        },
        {
            -- Coin
            x = 500,
            y = 300,
            size = 5,
            draw = drawCoin,
            update = updateCoin
        },
        {
            -- Coin
            x = 500,
            y = 300,
            size = 5,
            draw = drawCoin,
            update = updateCoin
        },
        {
            -- Coin
            x = 100,
            y = 200,
            size = 5,
            draw = drawCoin,
            update = updateCoin
        },
        {
            -- Coin
            x = 300,
            y = 600,
            size = 5,
            draw = drawCoin,
            update = updateCoin
        },
        {
            -- Enemy
            x = 200,
            y = 200,
            size = 7,
            draw = drawEnemy,
            update = updateEnemy
        }
    }
end

function love.update(dt)
    -- actors logic (if coin exists)
    for i in pairs(actors) do
        local coin = actors[i]
        coin:update(i, dt)
    end
end

function love.draw()
    -- draw actors if it exists
    for i in pairs(actors) do
        local coin = actors[i]
        coin:draw()
    end
end
