GameBackGroundLayer = class("GameBackGroundLayer", function()
	return display.newLayer();

end)

function GameBackGroundLayer:ctor()

	self.bg01 = nil
	self.bg02 = nil
	self.isPlayBackMusic = true

	self.bg01 = display.newSprite("image/bg01.jpg")
	:pos(display.cx, display.cy)
	:addTo(self)

	self.bg02 = display.newSprite("image/bg02.jpg")
	self.bg02:pos(display.cx, display.cy)

	
end




return GameBackGroundLayer;