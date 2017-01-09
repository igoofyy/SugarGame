local Sugar = require("app.object.Sugar")
local Ghost = require("app.object.Ghost")

GameBackGroundLayer = class("GameBackGroundLayer", function()
	return display.newLayer();

end)

function GameBackGroundLayer:ctor()

	self.bg01 = nil
	self.bg02 = nil
	self.player = nil
	self.isPlayBackMusic = true
	self.ghost = {}

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

    self:addBody("greenSugar", Sugar)
	self:addBody("ghost",Ghost)

	self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, handler(self, self.scrollBackgrounds))
    self:scheduleUpdate()

	self:addVelocityToBird()

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

    -- 把对应的精灵添加到地图
        local sprite = class.new(x, y)
       		:addTo(self)

	if objectGroupName == "ghost" then

        table.insert(self.ghost, sprite)

    end
    end
end

function GameBackGroundLayer:addVelocityToBird()

    local  dict    = nil

    local  i       = 0

    local  len     = table.getn(self.ghost)

    print(#self.ghost)

    for i = 0, len-1, 1 do

        dict = self.ghost[i + 1]

        if dict == nil  then

            break

        end



        local x = dict:getPositionX()

        if x <= display.width  - self.map:getPositionX() then

            if dict:getPhysicsBody():getVelocity().x == 0 then

                dict:getPhysicsBody():setVelocity(cc.p(math.random(-40, 40), -98))
                print(dict:getPhysicsBody():getVelocity().y);
				
            else
            	-- print("+++++++++++++++++")

                table.remove(self.ghost, i + 1)

            end

        end

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

	number01 = self.map:getPositionY() - 2
	number02 =  self.map:getContentSize().height
	if number01  <= -number02  then
		self.map:setPosition(0,0)
	else
		self.map:setPosition(0,self.map:getPositionY() - 10)
	end
	
	print(self.map:getPositionY(),self.map:getPositionX())
end


return GameBackGroundLayer;