local Max = 50 -- Amount of misses to Kill the Player
local font = "vcr.ttf";

function onCreate()
	addCharacterToList('bfITSNOTYOU', 'boyfriend')


	luaDebugMode = true
	
	setProperty('defaultCamZoom', 0.8);

	setProperty('cameraSpeed', 2.2);

	setProperty('health', 2.0);

	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Disabled');


    makeLuaSprite('vignette', 'blackvignette', 0, 0);
	setProperty('vignette.alpha', 0.8);
	setObjectCamera('vignette', 'hud')
	addLuaSprite('vignette', true);
	
end

function onCreatePost()
	makeLuaText('info', 'Dont Get ' .. (Max) .. (" Misses..") , 300, 135 + getProperty('healthBarBG.width') / 2, getProperty('healthBarBG.y') + -80);
    setTextBorder('info', 2, '000000');
    setTextAlignment('info', 'right');
    setTextFont('info', font);
    setTextSize('info', 21.25);
	setTextColor('info', '990000')
	--addLuaText('info')
	setProperty('info.alpha', 0.0001);

	makeLuaText('info2', '     Fucked Up        ', 300, 135 + getProperty('healthBarBG.width') / 2, getProperty('healthBarBG.y') + -80);
    setTextBorder('info2', 2, '000000');
	setTextAlignment('info2', 'right');
    setTextFont('info2', font);
    setTextSize('info2', 21.25);
	setTextColor('info2', '110900')
	
end

function onBeatHit()
	if curBeat == 1 then
		doTweenAlpha('info', 'info', 1, 0.8, 'quintOut');
	elseif curBeat == 10 then
		doTweenAlpha('info', 'info', 0.001, 2, 'quintOut');

end


	

function noteMiss()
	if getProperty('songMisses') == Max then
		setProperty('health', getProperty('health')-200);
	elseif getProperty('songMisses') == 10 then
		setProperty('fx2.alpha', 0.4)
	elseif getProperty('songMisses') == 15 then
		setProperty('fx2.alpha', 0.5)
	elseif getProperty('songMisses') == 20 then
		setProperty('fx2.alpha', 0.6)	
	elseif getProperty('songMisses') == 30 then
		setProperty('fx2.alpha', 0.7)
	elseif getProperty('songMisses') == 40 then
		setProperty('fx2.alpha', 0.8)
	end
end
end

function onUpdate()
	if getProperty('songMisses') > 25 then
		cameraShake("hud", 0.002, 0.4);
	end
end

function onGameOver()
	if  getProperty('songMisses') == Max then
			setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Toykeeper'); --put in mods/music/
			setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'Laugh');
			setPropertyFromClass('GameOverSubstate', 'characterName', 'bfITSNOTYOU'); --Character json file for the death animation
			addLuaSprite('fx', true)
			setProperty('fx.alpha', 0.8)
    end
end