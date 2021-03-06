
local Ghost = class("Ghost", function()
    return display.newSprite("image/ghost.png")
end)

local MATERIAL_DEFAULT = cc.PhysicsMaterial(0.0, 0.0, 0.0)

function Ghost:ctor(x, y)

    local heartBody = cc.PhysicsBody:createCircle(self:getContentSize().width / 2,
        MATERIAL_DEFAULT)
    heartBody:setRotationEnable(false)

    heartBody:setCategoryBitmask(0x0001)
    heartBody:setContactTestBitmask(0x0100)
    heartBody:setCollisionBitmask(0x0001)

    self:setPhysicsBody(heartBody)
    self:getPhysicsBody():setGravityEnable(false)  
    self:setTag(CONFIG_GAME_GHOST_TAG)  

    self:setPosition(x, y)
end

return Ghost

