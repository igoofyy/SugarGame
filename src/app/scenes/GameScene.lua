local GameBackGroundLayer = require("app.layer.GameBackGroundLayer")
local Player = require("app.object.Player")

GameScene = class("GameScene", function()
	return display.newScene("GameScene")
end)

function GameScene:ctor()

	-- self:configBackground()

	-- -- 设置世界的物理引擎
 --    self.world = self:getPhysicsWorld()
 --    self.world:setGravity(cc.p(0, -92))
 --    self.world:setDebugDrawMask(cc.PhysicsWorld.DEBUGDRAW_ALL)

	self.backGroundLayer = GameBackGroundLayer.new()
		:setAnchorPoint(0,0)
		:addTo(self)
	
	self:eventRegister()

end

-- 事件注册
function GameScene:eventRegister()

	-- 注册点击事件
	self.backGroundLayer:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
			return self:onTouch(event.name,event.x,event.y)
		end)
	self.backGroundLayer:setTouchEnabled(true)

end

function GameScene:onEnter()


end


function GameScene:onExit()


end

function GameScene:onTouch( event, x, y )

	self.backGroundLayer.player:setPosition(x,y)
	return true
end


return GameScene
