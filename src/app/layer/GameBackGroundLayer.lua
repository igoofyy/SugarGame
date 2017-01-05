GameBackGroundLayer = class("GameBackGroundLayer", function()
	return display.newLayer();

end)

function GameBackGroundLayer:ctor()

	self.bg01 = nil
	self.bg02 = nil
	self.player = nil
	self.isPlayBackMusic = true

	self.bg01 = display.newSprite("image/bg01.jpg")
	-- :setContentSize(display.cx,display.cy)
	:setPosition(display.cx,display.cy)
	:addTo(self)

	self.bg02 = display.newSprite("image/bg02.jpg")
	:setPosition(display.cx,display.cy * 3)
	:addTo(self)

	self.player = Player.new()
		:setPosition(CONFIG_SCREEN_WIDTH/2,50)
		:addTo(self)
	
	self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, handler(self, self.scrollBackgrounds))
    self:scheduleUpdate()
end





-- 滚动背景造成视觉差
function GameBackGroundLayer:scrollBackgrounds()

	if self.bg01:getPositionY() - 1 <= - display.cy then
		self.bg01:setPosition(display.cx,display.cy * 3)
	else
		self.bg01:setPosition(display.cx,self.bg01:getPositionY() - 1)
	end

	if self.bg02:getPositionY() - 1 <= - display.cy then
		self.bg02:setPosition(display.cx,display.cy * 3)
	else
		self.bg02:setPosition(display.cx,self.bg02:getPositionY() - 1)
	end


end


return GameBackGroundLayer;