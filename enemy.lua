local Enemy = {}

Enemy.componentName = "Enemy"

function Enemy.draw(actor)
    love.graphics.setColor(1, 0.5, 0.5)
    love.graphics.circle("fill", actor.x, actor.y, actor.size)
end

function Enemy.update(actor, i, dt)
    local player = getFirstActorWithTag("player")
    if calculateDistance(player, actor) < actor.size + player.size then
        -- destroy actor, remove from list
        table.remove(actors, i)

        -- grow from eating a actor
        player.size = player.size - actor.size
    end
end

return Enemy
