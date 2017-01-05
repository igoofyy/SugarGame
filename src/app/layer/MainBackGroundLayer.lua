MainBackGroundLayer = class("MainBackGroundLayer", function()
	return display.newLayer()
end)


function  MainBackGroundLayer:ctor()

	self:createBackground()
end


function MainBackGroundLayer:createBackground()

	local bg = display.newSprite("image/homeBg.jpg")
	:pos(display.cx, display.cy)
	:addTo(self)



end

return MainBackGroundLayer