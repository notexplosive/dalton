function newObject(classType)
    local object = {}

    -- Do some lua magic so that myActor:update() calls Actor.update(myActor)
    setmetatable(object, classType)
    classType.__index = classType

    return object
end

function calculateDistance(pointA, pointB)
    local diffx, diffy = pointA.x - pointB.x, pointA.y - pointB.y
    local distanceSquared = diffx * diffx + diffy * diffy
    return math.sqrt(distanceSquared)
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
