local Coin = {}

function Coin.draw(coin)
    love.graphics.setColor(1, 1, 0.5)
    love.graphics.circle("fill", coin.x, coin.y, coin.size)
end

function Coin.update(actor, i, dt)
    local player = getFirstActorWithTag("player")
    if calculateDistance(player, actor) < actor.size + player.size then
        -- destroy actor, remove from list
        table.remove(actors, i)

        -- grow from eating a actor
        player.size = player.size + actor.size
    end
end

return Coin
