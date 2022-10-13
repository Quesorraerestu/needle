function onCreate()
	makeAnimatedLuaSprite('fx', 'vintage', 0, 0)
	addAnimationByPrefix('fx', 'idle', 'idle', 16, true)
	scaleObject('fx', 3, 3)
	setObjectCamera('fx', 'camHud')
	objectPlayAnimation('fx', 'idle', true)
	setProperty('fx.alpha', 0)

	makeAnimatedLuaSprite('fx2', 'vintage', 0, 0)
	addAnimationByPrefix('fx2', 'idle', 'idle', 16, true)
	scaleObject('fx2', 3, 3)
	setObjectCamera('fx2', 'other')
	objectPlayAnimation('fx2', 'idle', true)
	setProperty('fx2.alpha', 0)

	addCharacterToList('sonicexe', 'boyfriend')
	precacheSound('stat')

	setPropertyFromClass('GameOverSubstate', 'characterName', 'sonic')
end

function onSongStart()
	addLuaSprite('fx', true)
	addLuaSprite('fx2', true)

end

function onStepHit()
	if curStep == 10 then
		modchart = false
	end
	if curStep == 110 or curStep == 120 or curStep == 125 or curStep == 928 or curStep == 932 or curStep == 938 or curStep == 958 or curStep == 1172 or curStep == 1276 or curStep == 1282 or curStep == 1304 or curStep == 1536 or curStep == 1922 or curStep == 1937 or curStep == 1943 or curStep == 1956 then
		staticON()
	end
	if curStep == 127 or curStep == 1024 or curStep == 1154 or curStep == 1176 or curStep == 1279 or curStep == 1300 or curStep == 1408 or curStep == 1792 or curStep == 1926 or curStep == 1940 or curStep == 1946 or curStep == 1960 then
		staticOFF()
	end
	if curStep == 128 then
		if songName == 'Toykeeper' then
			triggerEvent('Change Character', 1, 'sonicexe')
		end
	end
end

function staticON()
	setProperty('fx.alpha', 0.8)
	doTweenAlpha('staticON', 'fx', 0, 1, 'linear')
	playSound('stat', 0.3)
end

function staticOFF()
	setProperty('fx.alpha', 1)
	doTweenAlpha('staticON', 'fx', 0, 1, 'linear')
	playSound('stat', 0.3)
end
