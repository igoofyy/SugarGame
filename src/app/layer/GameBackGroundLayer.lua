GameBackGroundLayer = class("GameBackGroundLayer", function()
	return display.newLayer();

end)

function GameBackGroundLayer:ctor()

	self.bg01 = nil
	self.bg02 = nil
	self.isPlayBackMusic = true

	self.bg01 = display.newSprite("image/bg01.jpg")
	-- :setContentSize(display.cx,display.cy)
	:setPosition(display.cx,display.cy)
	:addTo(self)

	self.bg02 = display.newSprite("image/bg02.jpg")
	:setPosition(display.cx,display.cy * 3)
	:addTo(self)
	
	self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, handler(self, self.scrollBackgrounds))
    self:scheduleUpdate()

    print(display.cx,display.cy)

    -- self.bg01:setPosition(0,-285)

    -- print(self.bg01:getPositionY())
    -- self.bg01:setAnchorPoint(0, 0)
end

-- 滚动背景造成视觉差
function GameBackGroundLayer:scrollBackgrounds()

	if self.bg01:getPositionY() - 1 <= - display.cy then
		self.bg01:setPosition(display.cx,display.cy * 3)
	else
		print(self.bg01:getPositionY())
		self.bg01:setPosition(display.cx,self.bg01:getPositionY() - 1)
	end

	if self.bg02:getPositionY() - 1 <= - display.cy then
		self.bg02:setPosition(display.cx,display.cy * 3)
	else
		print(self.bg02:getPositionY())
		self.bg02:setPosition(display.cx,self.bg02:getPositionY() - 1)
	end
	-- print(self.bg01:getPositionY() .. '----' .. display.cy)
-- print(self.bg02:getPositionY())


end


return GameBackGroundLayer;