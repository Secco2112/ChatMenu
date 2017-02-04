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
	
---------------------------------------------------------------------------------------------------------------------------------
	
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
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Merhaba")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Blz = Blz or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Iyi, hadi yapalim sunu!")
		managers.player:local_player():sound():say("p01",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Vlw = Vlw or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Tesekkurler!")
		managers.player:local_player():sound():say("s05x_sin",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Ajuda = Ajuda or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Biraz yardim!?")
		managers.player:local_player():sound():say("p45",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Yeah = Yeah or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Evet")
		managers.player:local_player():sound():say("v46",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Nope = Nope or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Hayir")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Shit = Shit or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "HASSIKTIR!")
		managers.player:local_player():sound():say("g60",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Fuck = Fuck or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "HAY S*KEYIM!")
		managers.player:local_player():sound():say("g29",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

NAmmo = NAmmo or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Cephaneye ihtiyacim var!")
		managers.player:local_player():sound():say("g81x_plu",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

NBag = NBag or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Ilk yardim cantasi yerlestir, lutfen")
		managers.player:local_player():sound():say("g80x_plu",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

NFirst = NFirst or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Ilk yardim kiti, lutfen")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

AmmoH = AmmoH or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Cephane burada")
		managers.player:local_player():sound():say("s01x_plu",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

MedicH = MedicH or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Ilk yardim cantasi burada")
		managers.player:local_player():sound():say("s02x_plu",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

FirstH = FirstH or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Ilk yardim kiti burada")
		managers.player:local_player():sound():say("s12",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Shield = Shield or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Kalkan!")
		managers.player:local_player():sound():say("f31y_any",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Winters = Winters or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Kaptan Winters!")
		managers.player:local_player():sound():say("cpa_a02_01",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
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
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
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
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Snipa = Snipa or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Keskin nisanci!")
		managers.player:local_player():sound():say("f34y_any",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
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
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
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
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

--NÃO FOI TESTADO
--[[Refem = Refem or function()  
if inCustody() then
managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Bir rehine bulun, lutfen!")
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
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
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
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
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
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

GrabDrill = GrabDrill or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Artik birisi alsin su matkabi!")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

FixDrill = FixDrill or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Birisi matkabi tamir edebilir mi? Lutfen!")
		managers.player:local_player():sound():say("d02x_sin",true,true)
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Crowbar = Crowbar or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Levye burada")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Keycard = Keycard or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Anahtar Karti burada")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Shaw = Shaw or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Shaw, Kurkler.")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Downtown = Downtown or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Downtown, Sigaralari bulmak zorundasin.")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Foggy = Foggy or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Foggy Bottom, Votka.")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

West = West or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "West End, Kimyasallari bul.")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Georgetown = Georgetown or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Georgetown, Barkodlar roketlerin içinde.")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

Gas = Gas or function()
	if not delay then
		delay=true
		managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", "Benzin burada")
		DelayedCalls:Add("timerParaNaoSpam", 5, ativarTimer)
		erro=false
	elseif delay and not erro then
		managers.hud:show_hint( { text = "Başka bir mesaj göndermek için 5 saniye beklemeniz gerekiyor", time = 2 } )
		erro=true
	end
end

---------------------------------------------------------------------------------------------------------------------------------
--MENU 1

opts = {}
opts[#opts+1] = { text = "Merhaba", callback = Oi }
opts[#opts+1] = { text = "Iyi", callback = Blz }
opts[#opts+1] = { text = "Tesekkurler!", callback = Vlw }
opts[#opts+1] = { text = "Yardim", callback = Ajuda }
opts[#opts+1] = { text = "Evet", callback = Yeah }
opts[#opts+1] = { text = "Hayir", callback = Nope }
opts[#opts+1] = { text = "HASSIKTIR!", callback = Shit }
opts[#opts+1] = { text = "S*KEYIM!", callback = Fuck }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Cephane lazim", callback = NAmmo }
opts[#opts+1] = { text = "Ilk yardim cantasi lazim", callback = NBag }
opts[#opts+1] = { text = "Ilk yardim kiti lazim", callback = NFirst }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Cephane burada", callback = AmmoH }
opts[#opts+1] = { text = "Ilk yardim cantasi burada", callback = MedicH }
opts[#opts+1] = { text = "Ilk yardim kiti burada", callback = FirstH }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Sonraki", callback = callmenu2 }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "KAPAT", is_cancel_button = true, is_focused_button = true, }
mymenu = SimpleMenu:new("Sohbet Menusu", "By Secco2112\nVersion 2.2\n=T$E=Vasquez Tarafindan Cevirildi.", opts)
if isPlaying() and inGame() and isMultiplayer() and managers.hud then
mymenu:show()

--MENU 2

opts = {}
opts[#opts+1] = { text = "Kalkan", callback = Shield }
opts[#opts+1] = { text = "Taser", callback = Lasier }
opts[#opts+1] = { text = "Cloaker", callback = Wululu }
opts[#opts+1] = { text = "Keskin nisanci", callback = Snipa }
opts[#opts+1] = { text = "Bulldozer", callback = Dozer }
opts[#opts+1] = { text = "Skulldozer", callback = SkullDozer }
opts[#opts+1] = { text = "Kaptan Winters", callback = Winters }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Anahtar Karti burada", callback = Keycard }
opts[#opts+1] = { text = "Levye burada", callback = Crowbar }
opts[#opts+1] = { text = "Gaz burada", callback = Gas }
opts[#opts+1] = { text = "", is_cancel_button = true }
if managers.job:current_level_id() == 'alex_1' or managers.job:current_level_id() == 'rat' or managers.job:current_level_id() == 'nail' then
opts[#opts+1] = { text = "Matkabi alin", callback = GrabDrill }
opts[#opts+1] = { text = "Matkabi tamir edin", callback = FixDrill }
else
opts[#opts+1] = { text = "Matkabi alin", callback = GrabDrill }
opts[#opts+1] = { text = "Matkabi tamir edin", callback = FixDrill }
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
opts[#opts+1] = { text = "Sonraki", callback = callmenu3, is_focused_button = true, }
end
opts[#opts+1] = { text = "Onceki", callback = callmenu1, is_focused_button = true, }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "KAPAT", is_cancel_button = true }
mymenu2 = SimpleMenu:new("Sohbet Menusu", "By Secco2112\nVersion 2.2\n=T$E=Vasquez Tarafindan Cevirildi.", opts)
mymenu2:hide()

--MENU 3

opts = {}
opts[#opts+1] = { text = "Shaw - Kurkler", callback = Shaw }
opts[#opts+1] = { text = "Downtown - Sigaralar", callback = Downtown }
opts[#opts+1] = { text = "Foggy Bottom - Votkalar", callback = Foggy }
opts[#opts+1] = { text = "West End - Kimyasallar", callback = West }
opts[#opts+1] = { text = "Georgetown - Roketler", callback = Georgetown }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Muriatic Acid", callback = Mu }
opts[#opts+1] = { text = "Hydrogen Chloride", callback = Hcl }
opts[#opts+1] = { text = "Caustic Soda", callback = Cs }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "Onceki", callback = callmenu2, is_focused_button = true, }
opts[#opts+1] = { text = "", is_cancel_button = true }
opts[#opts+1] = { text = "KAPAT", is_cancel_button = true }
mymenu3 = SimpleMenu:new("Sohbet Menusu", "By Secco2112\nVersion 2.2\n=T$E=Vasquez Tarafindan Cevirildi.", opts)
mymenu3:hide()

elseif not managers.hud then
_dialog_data = { 
				title = "SOHBET MENUSU",
				text = "Eger bir soygunda degilseniz sohbet menusu acilamaz.",
				button_list = {{ text = "OK", is_cancel_button = true }},
				id = tostring(math.random(0,0xFFFFFFFF))
			}
			end
if managers.system_menu then
	managers.system_menu:show(_dialog_data)
end
