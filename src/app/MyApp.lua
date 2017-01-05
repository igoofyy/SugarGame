
require("config")
require("cocos.init")
require("framework.init")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    
    self:configGame()

    self:enterScene("MainScene")


end

function MyApp:configGame()

	cc.FileUtils:getInstance():addSearchPath("res/")
    cc.Director:getInstance():setContentScaleFactor(568 / CONFIG_SCREEN_HEIGHT)

end

return MyApp
