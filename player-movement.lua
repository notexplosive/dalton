local PlayerMovement = {}

PlayerMovement.componentName = "PlayerMovement"

function PlayerMovement.setup(self)
    self.velocity = {x = 0, y = 0}
    self.speed = 500
    self.size = 10
end

function PlayerMovement.draw(self)
    -- blank
end

function PlayerMovement.update(self, i, dt)
    -- set self velocity based on input
    self.velocity.x = 0
    self.velocity.y = 0

    if love.keyboard.isDown("right") then
        self.velocity.x = self.velocity.x + 1
    end

    if love.keyboard.isDown("left") then
        self.velocity.x = self.velocity.x - 1
    end

    if love.keyboard.isDown("up") then
        self.velocity.y = self.velocity.y - 1
    end

    if love.keyboard.isDown("down") then
        self.velocity.y = self.velocity.y + 1
    end

    -- move self by velocity
    self.actor.pos.x = self.actor.pos.x + self.velocity.x * self.speed * dt
    self.actor.pos.y = self.actor.pos.y + self.velocity.y * self.speed * dt
end

return PlayerMovement
