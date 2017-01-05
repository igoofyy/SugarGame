local GameBackGroundLayer = require("app.layer.GameBackGroundLayer")

GameScene = class("GameScene", function()
	return display.newScene("GameScene")
end)

function GameScene:ctor()

	-- self:configBackground()

	self.backGroundLayer = GameBackGroundLayer.new()
		:addTo(self)
	

end

function GameScene:onEnter()


end


function GameScene:onExit()


end


return GameScene
