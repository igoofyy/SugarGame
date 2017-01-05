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

    cc.ui.UIPushButton.new({ normal = "image/start_01.png", pressed = "image/start_02.png" })
        :onButtonClicked(function()
            print("start")
            -- audio.playSound("sound/button.wav")
            app:enterScene("GameScene", nil, "SLIDEINT", 0.5)
        end)
        :pos( display.cx , 50)
        :addTo(self)

end

return MainScene
