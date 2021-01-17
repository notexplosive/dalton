local Player = {}

Player.componentName = "Player"

function Player.setup(self)
    self.velocity = {x = 0, y = 0}
    self.speed = 500
    self.x = 200
    self.y = 200
    self.size = 10
end

function Player.draw(self)
    print(self.x, self.y)
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", self.x, self.y, self.size)
end

function Player.update(self, i, dt)
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
    self.x = self.x + self.velocity.x * self.speed * dt
    self.y = self.y + self.velocity.y * self.speed * dt
end

return Player
