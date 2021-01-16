actors = nil
require "extra"

local Coin = require "coin"
local Player = require "player"
local Enemy = require "enemy"

function love.load()
    actors = {
        {
            -- Players
            x = 100,
            y = 100,
            velocity = {x = 0, y = 0},
            speed = 240,
            size = 10,
            draw = Player.draw,
            update = Player.update,
            tags = {"player"}
        },
        {
            -- Coin
            x = 500,
            y = 300,
            size = 5,
            draw = Coin.draw,
            update = Coin.update
        },
        {
            -- Coin
            x = 500,
            y = 300,
            size = 5,
            draw = Coin.draw,
            update = Coin.update
        },
        {
            -- Coin
            x = 100,
            y = 200,
            size = 5,
            draw = Coin.draw,
            update = Coin.update
        },
        {
            -- Coin
            x = 300,
            y = 600,
            size = 5,
            draw = Coin.draw,
            update = Coin.update
        },
        {
            -- Enemy
            x = 200,
            y = 200,
            size = 7,
            draw = Enemy.draw,
            update = Enemy.update
        }
    }
end

function love.update(dt)
    -- actors logic (if coin exists)
    for i in pairs(actors) do
        local actor = actors[i]
        actor:update(i, dt)
    end
end

function love.draw()
    -- draw actors if it exists
    for i in pairs(actors) do
        local actor = actors[i]
        actor:draw()
    end
end
