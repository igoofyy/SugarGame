Player = class("Player", function ()
	return display.newSprite("image/player01.png")
	-- body
end)


local MATERIAL_DEFAULT = cc.PhysicsMaterial(0.0, 0.0, 0.0)
function Player:ctor()

    -- self:addAnimationCache()

    local body = cc.PhysicsBody:createBox(self:getContentSize(), MATERIAL_DEFAULT)
    body:setRotationEnable(false)

    body:setCategoryBitmask(0x0111)
    body:setContactTestBitmask(0x1111)
    body:setCollisionBitmask(0x1001)

    self:setTag(200)
    self:setPhysicsBody(body)
    self:getPhysicsBody():setGravityEnable(false) 
end

function Player:fly()

end

function Player:die()
	-- body
end

function Player:hit()


end

function Player:hurt()
	-- body

end

return Player