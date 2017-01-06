local Sugar = require("app.object.Sugar")

GameBackGroundLayer = class("GameBackGroundLayer", function()
	return display.newLayer();

end)

function GameBackGroundLayer:ctor()

	self.bg01 = nil
	self.bg02 = nil
	self.player = nil
	self.isPlayBackMusic = true
	self.bird = {}

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

	self.map = cc.TMXTiledMap:create("image/sugar.tmx")
		:align(display.BOTTOM_LEFT, display.left, display.bottom)
		:addTo(self)

    self:addBody("ghost", Sugar)
	
	self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, handler(self, self.scrollBackgrounds))
    self:scheduleUpdate()
end

function GameBackGroundLayer:addBody(objectGroupName, class)
    local objects = self.map:getObjectGroup(objectGroupName):getObjects()
    local  dict    = nil
    local  i       = 0
    local  len     = table.getn(objects)

    for i = 0, len-1, 1 do
        dict = objects[i + 1]

        if dict == nil then
            break
        end
        
        local key = "x"
        local x = dict["x"]
        key = "y"
        local y = dict["y"]
    
        local sprite = class.new(x, y)
       		:addTo(self.map)

        print("===================",x,y)
    end
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

	if self.map:getPositionY() - 2 <= - self.map:getContentSize().height then
		self.map:setPosition(0,0)
	else
		self.map:setPosition(0,self.map:getPositionY() - 6)
	end
	
	-- print(self.map:getPositionY())
end


return GameBackGroundLayer;