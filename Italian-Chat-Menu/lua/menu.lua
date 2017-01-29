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

Oi = Oi or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Ciao")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Va bene, facciamolo!")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Grazie!")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Un aiutino!?")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Si")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "No")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "MERDA!")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "CAZZO!")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Mi servono munizioni!")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Piazza il kit medico, per favore")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Kit di pronto soccorso, per favore")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Munizioni qui")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Kit medico qui")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Kit di pronto soccorso qui")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Capitano Winters!")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Cecchino!")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Acido Muriatico")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Acido Cloridrico")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Soda Caustica")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Qualcuno prenda il trapano!")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Qualcuno che ripari questo trapano? Per favore!")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Piede di porco qui")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Scheda magnetica qui")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Shaw. Pellicce.")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "E' Downtown. Dobbiamo trovare i sigari.")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "E' Foggy Bottom. Vodka.")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "West End, trovate gli ingredienti.")
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Georgetown, codici a barre nei missili.")
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
opts[#opts+1] = { text = "Ciao", callback = Oi }
opts[#opts+1] = { text = "Va bene", callback = Blz }
opts[#opts+1] = { text = "Grazie!", callback = Vlw }
opts[#opts+1] = { text = "Aiuto!", callback = Ajuda }
opts[#opts+1] = { text = "Si", callback = Yeah }
opts[#opts+1] = { text = "No", callback = Nope }
opts[#opts+1] = { text = "'MERDA!'", callback = Shit }
opts[#opts+1] = { text = "'CAZZO!'", callback = Fuck }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Necessito munizioni!", callback = NAmmo }
opts[#opts+1] = { text = "Necessito kit medico!", callback = NBag }
opts[#opts+1] = { text = "Necessito kit di pronto soccorso!", callback = NFirst }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Munizioni qui", callback = AmmoH }
opts[#opts+1] = { text = "Kit medico qui", callback = MedicH }
opts[#opts+1] = { text = "Kit di pronto soccorso qui", callback = FirstH }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Successivo", callback = callmenu2, is_focused_button = true, }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "CHIUDI", is_cancel_button = true }
mymenu = SimpleMenu:new("CHAT MENU", "Creata da Secco2112\nVersione 2.2\nTradotto da Winston Wolfe", opts)
if isPlaying() and inGame() and isMultiplayer() and managers.hud then
mymenu:show()

--MENU 2

opts = {}
opts[#opts+1] = { text = "Shield", callback = Shield }
opts[#opts+1] = { text = "Taser", callback = Lasier }
opts[#opts+1] = { text = "Cloaker", callback = Wululu }
opts[#opts+1] = { text = "Cecchino", callback = Snipa }
opts[#opts+1] = { text = "Bulldozer", callback = Dozer }
opts[#opts+1] = { text = "Skulldozer", callback = SkullDozer }
opts[#opts+1] = { text = "Capitano Winters", callback = Winters }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Scgeda magnetica here", callback = Keycard }
opts[#opts+1] = { text = "Piede di porco qui", callback = Crowbar }
opts[#opts+1] = { text = "Benzina qui", callback = Gas }
opts[#opts+1] = { text = "", is_cancel_button = true }
if managers.job:current_level_id() == 'alex_1' or managers.job:current_level_id() == 'rat' or managers.job:current_level_id() == 'nail' then
opts[#opts+1] = { text = "Prendete il trapano", callback = GrabDrill }
opts[#opts+1] = { text = "Riparate il trapano", callback = FixDrill }
else
opts[#opts+1] = { text = "Prendete il trapano", callback = GrabDrill }
opts[#opts+1] = { text = "Riparate il trapano", callback = FixDrill }
opts[#opts+1] = { text = "", is_cancel_button = true }
end
if managers.job:current_level_id() == 'alex_1' or managers.job:current_level_id() == 'rat' or managers.job:current_level_id() == 'nail' then
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Acido Muriatico", callback = Mu }
opts[#opts+1] = { text = "Acido Cloridrico", callback = Hcl }
opts[#opts+1] = { text = "Soda Caustica", callback = Cs }
opts[#opts+1] = { text = "", is_cancel_button = true }
end
if managers.job:current_level_id() == 'mia_1' then
opts[#opts+1] = { text = "Successivo", callback = callmenu3, is_focused_button = true, }
end
opts[#opts+1] = { text = "Precedente", callback = callmenu1 }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "CHIUDI", is_cancel_button = true }
mymenu2 = SimpleMenu:new("CHAT MENU", "Creata da Secco2112\nVersione 2.2\nTradotto da Winston Wolfe", opts)
mymenu2:hide()

--MENU 3

opts = {}
opts[#opts+1] = { text = "Shaw - Pellicce", callback = Shaw }
opts[#opts+1] = { text = "Downtown - Sigari", callback = Downtown }
opts[#opts+1] = { text = "Foggy Bottom - Vodka", callback = Foggy }
opts[#opts+1] = { text = "West End - Ingredienti", callback = West }
opts[#opts+1] = { text = "Georgetown - Missili", callback = Georgetown }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Acido Muriatico", callback = Mu }
opts[#opts+1] = { text = "Acido Cloridrico", callback = Hcl }
opts[#opts+1] = { text = "Soda Caustica", callback = Cs }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Precedente", callback = callmenu2, is_focused_button = true, }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "CHIUDI", is_cancel_button = true }
mymenu3 = SimpleMenu:new("CHAT MENU", "Creata da Secco2112\nVersione 2.2\nTradotto da Winston Wolfe", opts)
mymenu3:hide()

elseif not managers.hud then
_dialog_data = { 
				title = "CHAT MENU",
				text = "Non puoi aprire il menu se non sei in un colpo.",
				button_list = {{ text = "OK", is_cancel_button = true }},
				id = tostring(math.random(0,0xFFFFFFFF))
			}
			end
if managers.system_menu then
	managers.system_menu:show(_dialog_data)
end
