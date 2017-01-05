ScoreLayer = class("ScoreLayer", function()
	return display.newLayer();
end)

-- 属性 score

function ScoreLayer:ctor()

	self.score = 0
	self.width = self.getContentSize().width
	self.height = self.getContentSize().heigt

	local bg = display.newSprite("image/score_bg.png")
	:pos(self.width, self.height)
	:addTo(self)

end


function ScoreLayer:configScore(score)

	self.score = score
	
	print(self.score)

end


return ScoreLayer