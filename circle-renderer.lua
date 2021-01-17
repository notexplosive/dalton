local CircleRenderer = {}

CircleRenderer.componentName = "CircleRenderer"

function CircleRenderer.setup(self)
    self.size = 10
    self.color = {1, 1, 1}
end

function CircleRenderer.draw(self)
    love.graphics.setColor(self.color)
    love.graphics.circle("fill", self.actor.pos.x, self.actor.pos.y, self.size)
end

function CircleRenderer.update(self, i, dt)
    -- this function is intentionally left blank
end

return CircleRenderer
