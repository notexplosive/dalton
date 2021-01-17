actors = nil
require "extra"

local Coin = require "coin"
local Player = require "player"
local Enemy = require "enemy"

-- example: local player = createActor({Player})
function createActor(componentClasses)
    local actor = {}

    actor.componentTable = {}
    actor.componentList = {}

    for i, componentClass in ipairs(componentClasses) do
        local component = newObject(componentClass)
        component.actor = actor

        component:setup()

        -- so we can get actor.MyComponent
        actor.componentTable[componentClass.componentName] = component

        -- so we can call update() and draw()
        actor.componentList[#actor.componentList + 1] = component
    end

    return actor
end

function love.load()
    actors = {}
    actors[#actors + 1] = createActor({Player})
    --[[
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
        ]]
end

function love.update(dt)
    for i in pairs(actors) do
        local actor = actors[i]
        for j in pairs(actor.componentList) do
            local component = actor.componentList[j]
            component:update(i, dt)
        end
    end
end

function love.draw()
    for i in pairs(actors) do
        local actor = actors[i]
        for j in pairs(actor.componentList) do
            local component = actor.componentList[j]
            component:draw()
        end
    end
end
