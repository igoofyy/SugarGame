
local Sugar = class("Sugar", function()
    return display.newSprite("image/sugar2.png")
end)

local MATERIAL_DEFAULT = cc.PhysicsMaterial(0.0, 0.0, 0.0)

function Sugar:ctor(x, y)

    local heartBody = cc.PhysicsBody:createCircle(self:getContentSize().width / 2,
        MATERIAL_DEFAULT)
    heartBody:setDynamic(false)

    heartBody:setCategoryBitmask(0x0001)
    heartBody:setContactTestBitmask(0x0100)
    heartBody:setCollisionBitmask(0x0001)

    self:setPhysicsBody(heartBody)
    self:getPhysicsBody():setGravityEnable(false)  
    self:setTag(20)  

    self:setPosition(x, y)
end

return Sugar

