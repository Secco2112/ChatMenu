-- SIMPLE MENU
if not SimpleMenu then
    SimpleMenu = class()

    function SimpleMenu:init(title, message, options)
        self.dialog_data = { title = title, text = message, button_list = {},
                             id = tostring(math.random(0,0xFFFFFFFF)) }
        self.visible = false
        for _,opt in ipairs(options) do
            local elem = {}
            elem.text = opt.text
            opt.data = opt.data or nil
            opt.callback = opt.callback or nil
            elem.callback_func = callback(self, self, "_do_callback",
                                          { data = opt.data,
                                            callback = opt.callback})
            elem.cancel_button = opt.is_cancel_button or false
            if opt.is_focused_button then
                self.dialog_data.focus_button = #self.dialog_data.button_list+1
            end
            table.insert(self.dialog_data.button_list, elem)
        end
        return self
    end

    function SimpleMenu:_do_callback(info)
        if info.callback then
            if info.data then
                info:callback(info.data)
            else
                info:callback()
            end
        end
        self.visible = false
    end

    function SimpleMenu:show()
        if self.visible then
            return
        end
        self.visible = true
        managers.system_menu:show(self.dialog_data)
    end

    function SimpleMenu:hide()
        if self.visible then
            managers.system_menu:close(self.dialog_data.id)
            self.visible = false
            return
        end
    end
end


---------------------------------------------------------------------------------------------------------------------------------


--FUNÇÕES GLOBAIS

function isPlaying()
		if not BaseNetworkHandler then return false end
		return BaseNetworkHandler._gamestate_filter.any_ingame_playing[ game_state_machine:last_queued_state_name() ]
	end
	

function inGame()
		if not game_state_machine then return false end
		return string.find(game_state_machine:current_state_name(), "game")
	end
	
local isMultiplayer = isMultiplayer or function()
        if managers.network == nil then
            return false
        end
        return managers.network:session()
    end
	
function inCustody()
		local player = managers.player:local_player()
		local in_custody = false
		if managers and managers.trade and alive( player ) then
			in_custody = managers.trade:is_peer_in_custody(managers.network:session():local_peer():id())
		end
		return in_custody
	end
	
-- OPEN MENU
function openmenu(menu)
        menu:show()
end

callmenu1 = function()
    openmenu(mymenu)
end

callmenu2 = function()
    openmenu(mymenu2)
end

callmenu3 = function()
    openmenu(mymenu3)
end

---------------------------------------------------------------------------------------------------------------------------------

--DELAY CALL PARA NÃO SPAMAR

delay=delay or false

--FUNCTION BASE BY BABYFORCE (ALL CREDITS BY THIS FOR HIM)
function ativarTimer()
	delay=false
end
	
---------------------------------------------------------------------------------------------------------------------------------

--MENSAGENS

local erro=false

Oi = Oi or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Hello")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Blz = Blz or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Alright, let's do this!")
		managers.player:local_player():sound():say("p01",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Vlw = Vlw or function()   
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Thanks!")
		managers.player:local_player():sound():say("s05x_sin",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Ajuda = Ajuda or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "A little help!?")
		managers.player:local_player():sound():say("p45",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Yeah = Yeah or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Yep")
		managers.player:local_player():sound():say("v46",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Nope = Nope or function()   
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Nope")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Shit = Shit or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "SHIT!")
		managers.player:local_player():sound():say("g60",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end  
end

Fuck = Fuck or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "FUCK!")
		managers.player:local_player():sound():say("g29",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

NAmmo = NAmmo or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "I need ammo!")
		managers.player:local_player():sound():say("g81x_plu",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

NBag = NBag or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Place a medic bag, pls")
		managers.player:local_player():sound():say("g80x_plu",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

NFirst = NFirst or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "First aid kit, please")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

AmmoH = AmmoH or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Ammo here")
		managers.player:local_player():sound():say("s01x_plu",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end 
end

MedicH = MedicH or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Medic bag here")
		managers.player:local_player():sound():say("s02x_plu",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end   

end

FirstH = FirstH or function()
if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "First aid kit here")
		managers.player:local_player():sound():say("s12",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end   
end

Shield = Shield or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Shield!")
		managers.player:local_player():sound():say("f31y_any",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end  
end

Winters = Winters or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Captain Winters!")
		managers.player:local_player():sound():say("cpa_a02_01",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end  
end

Lasier = Lasier or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Taser!")
		managers.player:local_player():sound():say("f32y_any",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Wululu = Wululu or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Cloaker!")
		managers.player:local_player():sound():say("f33y_any",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Snipa = Snipa or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Sniper!")
		managers.player:local_player():sound():say("f34y_any",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Dozer = Dozer or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "BULLDOZER!")
		managers.player:local_player():sound():say("f30y_any",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

SkullDozer = SkullDozer or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "SKULLDOZER!")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

--NÃO FOI TESTADO
--[[Refem = Refem or function()  
if inCustody() then
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Make a hostage, please!")
else
managers.chat:_receive_message(1, "Chat Menu", "You have to be in custody to use this message.", Color.red)
end
end]]--

Mu = Mu or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Muriatic Acid")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Hcl = Hcl or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Hydrogen Chloride")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Cs = Cs or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Caustic Soda")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

GrabDrill = GrabDrill or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Anyone grab this drill!")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

FixDrill = FixDrill or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Anyone fix this drill? Please!")
		managers.player:local_player():sound():say("d02x_sin",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Crowbar = Crowbar or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Crowbar here")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Keycard = Keycard or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Keycard here")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Shaw = Shaw or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Shaw. Furs.")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Downtown = Downtown or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Is Downtown. Have to find cigars.")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Foggy = Foggy or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Is Foggy Bottom. Vodka.")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

West = West or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "West End, find chemicals.")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Georgetown = Georgetown or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Georgetown, barcodes in rockets.")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

Gas = Gas or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Gasoline here")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "You need to wait 5 seconds to send another message", time = 2 } )
		erro=true
	end
end

---------------------------------------------------------------------------------------------------------------------------------
--MENU 1

opts = {}
opts[#opts+1] = { text = "Hello", callback = Oi }
opts[#opts+1] = { text = "Alright!", callback = Blz }
opts[#opts+1] = { text = "Thanks!", callback = Vlw }
opts[#opts+1] = { text = "Help?!", callback = Ajuda }
opts[#opts+1] = { text = "Yes", callback = Yeah }
opts[#opts+1] = { text = "Nope", callback = Nope }
opts[#opts+1] = { text = "SHIT!", callback = Shit }
opts[#opts+1] = { text = "FUCK!", callback = Fuck }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Need ammo!", callback = NAmmo }
opts[#opts+1] = { text = "Need a medic bag!", callback = NBag }
opts[#opts+1] = { text = "Need a first aid kit!", callback = NFirst }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Ammo here", callback = AmmoH }
opts[#opts+1] = { text = "Medic bag here", callback = MedicH }
opts[#opts+1] = { text = "First aid kit here", callback = FirstH }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Next", callback = callmenu2, is_focused_button = true, }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "CLOSE", is_cancel_button = true }
mymenu = SimpleMenu:new("CHAT MENU", "By Secco2112\nVersion 2.2", opts)
if isPlaying() and inGame() and isMultiplayer() and managers.hud then
mymenu:show()

--MENU 2

opts = {}
opts[#opts+1] = { text = "Shield", callback = Shield }
opts[#opts+1] = { text = "Taser", callback = Lasier }
opts[#opts+1] = { text = "Cloaker", callback = Wululu }
opts[#opts+1] = { text = "Sniper", callback = Snipa }
opts[#opts+1] = { text = "Bulldozer", callback = Dozer }
opts[#opts+1] = { text = "Skulldozer", callback = SkullDozer }
opts[#opts+1] = { text = "Captain Winters", callback = Winters }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Keycard here", callback = Keycard }
opts[#opts+1] = { text = "Crowbar here", callback = Crowbar }
opts[#opts+1] = { text = "Gas here", callback = Gas }
opts[#opts+1] = { text = "", is_cancel_button = true }
if managers.job:current_level_id() == 'alex_1' or managers.job:current_level_id() == 'rat' or managers.job:current_level_id() == 'nail' then
opts[#opts+1] = { text = "Grab the drill", callback = GrabDrill }
opts[#opts+1] = { text = "Fix the drill", callback = FixDrill }
else
opts[#opts+1] = { text = "Grab the drill", callback = GrabDrill }
opts[#opts+1] = { text = "Fix the drill", callback = FixDrill }
opts[#opts+1] = { text = "", is_cancel_button = true }
end
if managers.job:current_level_id() == 'alex_1' or managers.job:current_level_id() == 'rat' or managers.job:current_level_id() == 'nail' then
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Muriatic Acid", callback = Mu }
opts[#opts+1] = { text = "Hydrogen Chloride", callback = Hcl }
opts[#opts+1] = { text = "Caustic Soda", callback = Cs }
opts[#opts+1] = { text = "", is_cancel_button = true }
end
if managers.job:current_level_id() == 'mia_1' then
opts[#opts+1] = { text = "Next", callback = callmenu3, is_focused_button = true, }
end
opts[#opts+1] = { text = "Previous", callback = callmenu1 }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "CLOSE", is_cancel_button = true }
mymenu2 = SimpleMenu:new("CHAT MENU", "By Secco2112\nVersion 2.2", opts)
mymenu2:hide()

--MENU 3

opts = {}
opts[#opts+1] = { text = "Shaw - Furs", callback = Shaw }
opts[#opts+1] = { text = "Downtown - Cigars", callback = Downtown }
opts[#opts+1] = { text = "Foggy Bottom - Vodka", callback = Foggy }
opts[#opts+1] = { text = "West End - Chemicals", callback = West }
opts[#opts+1] = { text = "Georgetown - Rockets", callback = Georgetown }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Muriatic Acid", callback = Mu }
opts[#opts+1] = { text = "Hydrogen Chloride", callback = Hcl }
opts[#opts+1] = { text = "Caustic Soda", callback = Cs }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Previous", callback = callmenu2, is_focused_button = true, }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "CLOSE", is_cancel_button = true }
mymenu3 = SimpleMenu:new("CHAT MENU", "By Secco2112\nVersion 2.2", opts)
mymenu3:hide()

elseif not managers.hud then
_dialog_data = { 
				title = "CHAT MENU",
				text = "You can't open the Chat Menu if you aren't on a heist.",
				button_list = {{ text = "OK", is_cancel_button = true }},
				id = tostring(math.random(0,0xFFFFFFFF))
			}
			end
if managers.system_menu then
	managers.system_menu:show(_dialog_data)
end
