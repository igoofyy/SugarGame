local MainBackGroundLayer = require("app.layer.MainBackGroundLayer")

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    
    self:configLayer()
end

function MainScene:onEnter()


end

function MainScene:onExit()


end

 function MainScene:configLayer() 

	self.backgroundLayer = MainBackGroundLayer.new()
    :addTo(self)

end

return MainScene
