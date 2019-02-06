script_name('MoJ Helper')
script_author("Adriano_Emerson & Emerson inc.")
version_script = "0.4 Beta"
require "lib.moonloader"
local sampev = require 'lib.samp.events'
local memory = require "memory"
local keys = require "vkeys"
local main_color = 0x00C7EA
local imgui = require 'imgui'
local encoding = require 'encoding'
local show_main_window = imgui.ImBool(false)
local text_buffer = imgui.ImBuffer(256)
encoding.default = 'CP1251'
u8 = encoding.UTF8
--e_inc = nil
print("���������� ID � ��� ���������� ������")
_, myID = sampGetPlayerIdByCharHandle(PLAYER_PED)
userNick = sampGetPlayerNickname(myID)
	
function main()
	if not isSampLoaded() then return end
	while not isSampAvailable() do wait(100) end
		sampAddChatMessage("{00C7EA}[MoJ Helper]: {FFFFFF}MoJ Helper ������� ��������.", main_color)
		sampAddChatMessage("{00C7EA}[MoJ Helper]: {FFFFFF}��� ��������� �������� ������� {B22222}/mj.", main_color)
		sampRegisterChatCommand("cuff", cmd_cuff)
		sampRegisterChatCommand("hold", cmd_hold)
		sampRegisterChatCommand("push", cmd_push)
		sampRegisterChatCommand("arrest", cmd_arrest)
		sampRegisterChatCommand('mj', cmd_mj)
		sampRegisterChatCommand("ticket", cmd_ticket)
		sampRegisterChatCommand("ticket", cmd_ticket)
		print("������� ���������� ������� ���������.")
		imgui.Process = false
	--	if doesFileExist('moonloader\\MJHelper\\images\\e_inc.png') then
		--	e_inc = imgui.CreateTextureFromFile(getGameDirectory() .. '\\moonloader\\MJHelper\\images\\e_inc.png')
		--	else
		--	e_inc = false
		--	end
	while true do
        wait(0)
			if show_main_window.v == false then
				imgui.Process = false
			end
			if isKeyJustPressed(0x55) and not sampIsChatInputActive() then
				if enable == 1 then
					sampSendChat("/helplist")
					enable = 0
				end
			end
			if isCharInAnyCar(playerPed) and isKeyDown(0x12) and isKeyJustPressed (0x4D) then
				lua_thread.create(function()
				sampSendChat("/m ��������, ������������ � ������� � ����������������!")
				wait(1000)
				sampSendChat("/m � ������ ������������ ����� ������ ����� �� �������!!")				
			end)
		end
			if isCharInAnyCar(playerPed) and isKeyJustPressed(0x4A) and not sampIsChatInputActive() then
				if megaphone == 1 then
					lua_thread.create(function()
					sampSendChat("/m ��������, ��������� ���� � ������� �� � ����� ���������!")
					megaphone = 0
				end)
			end
		end
	end
end
function onWindowMessage(msg, wparam, lparam)
    if msg == 0x100 or msg == 0x101 then
        if (wparam == keys.VK_ESCAPE and show_main_window.v) and not isPauseMenuActive() then
            consumeWindowMessage(true, false)
            if msg == 0x101 then
                show_main_window.v = false
            end
        end
    end
end
function apply_custom_style()
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4

	style.WindowRounding = 2.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
	style.ChildWindowRounding = 2.0
	style.FrameRounding = 2.0
	style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 0
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0
	-- style.Alpha =
	-- style.WindowPadding =
	-- style.WindowMinSize =
	-- style.FramePadding =
	-- style.ItemInnerSpacing =
	-- style.TouchExtraPadding =
	-- style.IndentSpacing =
	-- style.ColumnsMinSpacing = ?
	-- style.ButtonTextAlign =
	-- style.DisplayWindowPadding =
	-- style.DisplaySafeAreaPadding =
	-- style.AntiAliasedLines =
	-- style.AntiAliasedShapes =
	-- style.CurveTessellationTol =

	colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
	colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
	colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
	colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
	colors[clr.ComboBg]                = colors[clr.PopupBg]
	colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
	colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
	colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
	colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
	colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
	colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
	colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
	colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
	colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
	colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
	colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
	colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
	colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
	colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
	colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
	colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
	colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.Separator]              = colors[clr.Border]
	colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
	colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
	colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
	colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
	colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
	colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
	colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
	colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
	colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end
apply_custom_style()
do
show_main_window = imgui.ImBool(false)
local show_imgui_patrol = imgui.ImBool(false)
local show_imgui_mj = imgui.ImBool(false)
local show_imgui_news = imgui.ImBool(false)
local show_imgui_megaphone = imgui.ImBool(false)
local moonimgui_text_buffer = imgui.ImBuffer('test', 256)
local imgui_input_mark = imgui.ImBuffer(u8'2-A-4', 256)
local imgui_input_you = imgui.ImBuffer(u8'Emerson #1112', 256)
local imgui_input_napar = imgui.ImBuffer(u8'Morgenshtern #1116', 256)
local imgui_input_pd = imgui.ImBuffer(u8'SFPD', 256)

function imgui.OnDrawFrame()
	-- Main Window
	if show_main_window.v then
		local sw, sh = getScreenResolution()
		-- center
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(300, 240), imgui.Cond.FirstUseEver)
		imgui.Begin('MoJ Helper', show_main_window)
		local btn_size = imgui.ImVec2(-0.1, 0)
		if imgui.Button(u8'���� �������', btn_size) then -- �������
			show_imgui_patrol.v = not show_imgui_patrol.v
		end
			if imgui.Button(u8'���� ��������', btn_size) then -- �������
				show_imgui_megaphone.v = not show_imgui_megaphone.v
			end
		if imgui.Button(u8'������ �������', btn_size) then
			show_imgui_mj.v = not show_imgui_mj.v
		end
		if imgui.Button(u8'������� ����������', btn_size) then
			show_imgui_news.v = not show_imgui_news.v
		end
		if userNick == 'Adriano_Emerson' then
			if imgui.Button(u8'���������� ��� ������������', btn_size) then
			
			end
		end	
		--if e_inc then
	--	imgui.SetCursorPos(imgui.ImVec2(0, 130))
		--imgui.Image(e_inc, imgui.ImVec2(300, 100))
		--imgui.SameLine()
		--else
		--imgui.Text(u8'��� ����� ���� ���� �������')
		--imgui.SameLine()
	--	end		
		imgui.End()
	end

	-- ���� ��������
	local sw, sh = getScreenResolution()
	local btn_size = imgui.ImVec2(-0.1, 0)
	if show_imgui_megaphone.v then
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 1.55, sh / 1.7), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(200, 100), imgui.Cond.FirstUseEver)
		imgui.Begin(u8'���� ��������', show_imgui_megaphone)
		if imgui.Button(u8'�������� ��� �������-�����', btn_size) then
			lua_thread.create(function()		
				sampSendChat("/m ��������, ��������� ���������, �������� ���� �� ����� �������, ����������� ��������� ...")
				wait(5000)
				sampSendChat("/m ... ������� ���� �� ���� � �������� ������ ����� �����.")
				wait(500)
				sampAddChatMessage('[MoJ Helper]: {FFFFFF} ���� � ���������� ��������� ��������, ������� {B22222}J', main_color)
				megaphone = 1
			end)
		end
		if imgui.Button(u8'�������� ��� �������-�����\n����������� �����', btn_size) then
			lua_thread.create(function()		
					sampSendChat("/m ��������, ��������� ���������, �������� ���� �� ����� ������� � ��������� ����� �� �����.")
					wait(7000)
					sampSendChat("/m ��������� ���� � ���� �, ��������, �������� ����� ������ �����, �������.")
					wait(7000)
					sampSendChat("/m ������� �� ����������, ��������� ������ � �������� ������ ������ ����.")
					wait(500)
					sampAddChatMessage("[MoJ Helper]:{FFFFFF} ����� ��������� ��������� �������� ����������", main_color)
			end)
		end	
		imgui.End()
	end

	-- ���� �������
	local sw, sh = getScreenResolution()
	local btn_size = imgui.ImVec2(-0.1, 0)
		if show_imgui_patrol.v then
			imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 1.76), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(600, 200), imgui.Cond.FirstUseEver)
			imgui.Begin(u8'���� �������', show_imgui_patrol)
			imgui.InputText(u8'����� ����������', imgui_input_mark) 
			imgui.InputText(u8'���� ������� � ����� ������', imgui_input_you) 
			imgui.InputText(u8'������� � ����� ���������', imgui_input_napar) 
			imgui.InputText(u8'�������� ������ ��', imgui_input_pd) 
			imgui.NewLine()
		if imgui.Button(u8'��������� ������ � ������ �������', btn_size) then
			if imgui_input_napar.v == '' then
				sampSendChat(string.format("/f %s, ������� ����� ��� %s, �� %s, �������� ��� ��������, �����.", u8:decode(imgui_input_you.v), imgui_input_mark.v, u8:decode(imgui_input_pd.v) ))
			else
				sampSendChat(string.format("/f %s & %s, �������� ����� ��� %s, �� %s, �������� ��� ��������, �����.", u8:decode(imgui_input_you.v), u8:decode(imgui_input_napar.v), imgui_input_mark.v, u8:decode(imgui_input_pd.v) ))			
			end	
		end
		if imgui.Button(u8'��������� ������ � ����� �������', btn_size) then
			if imgui_input_napar.v == '' then
				sampSendChat(string.format("/f %s, �������� �����, ���������� ���������� %s, � %s, �� ��������, �����.", u8:decode(imgui_input_you.v), u8:decode(imgui_input_mark.v), u8:decode(imgui_input_pd.v) ))
			else
				sampSendChat(string.format("/f %s %s, ��������� �����, ���������� ���������� %s, � %s, �� ��������, �����.", u8:decode(imgui_input_you.v), u8:decode(imgui_input_napar.v), u8:decode(imgui_input_mark.v), u8:decode(imgui_input_pd.v) ))		
			end
		end
		imgui.End()
	end
-- �������
	if show_imgui_mj.v then
	local sw, sh = getScreenResolution()
        imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2 - 280), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(520, 300), imgui.Cond.FirstUseEver)
        imgui.Begin(u8('������ ������'), show_imgui_mj, imgui.WindowFlags.NoResize)
		imgui.SetCursorPosX(180)
		imgui.Text(u8'������ ����������:')
		imgui.SameLine()
		imgui.TextColored(imgui.ImVec4(0.18, 0.91 , 0.87, 1.0), version_script)			
		imgui.BeginChild('left pane', imgui.ImVec2(495, 230), true, imgui.WindowFlags.VerticalScrollbar)
				imgui.BulletText(u8'/mj - ������� ���� MoJ Helper')
				imgui.NewLine()
				imgui.BulletText(u8'Alt + M - ���������� ��������� ��������.')
				imgui.NewLine()
				imgui.BulletText(u8'/cuff - �������������� ��������� ����������. (/cuff [ID])')
				imgui.BulletText(u8'/hold - �������������� ��������� �������������. (/hold [ID])')
				imgui.BulletText(u8'/push - �������������� ��������� ������� ������ � ���������. (/push [ID])')
				imgui.BulletText(u8'/arrest - �������������� ��������� ������ ������. (/arrest [ID])')			
		imgui.EndChild()
		imgui.SetCursorPosX(140)
		imgui.Text(u8'Copyright � Emerson inc. All Right Reserved.')			
        imgui.End()
    end
	
-- �������
	if show_imgui_news.v then
	local sw, sh = getScreenResolution()
        imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(520, 300), imgui.Cond.FirstUseEver)
        imgui.Begin(u8('���������� �� �����������'), show_imgui_news, imgui.WindowFlags.AlwaysAutoResize + imgui.WindowFlags.NoSavedSettings)
			imgui.BeginChild('left pane', imgui.ImVec2(495, 230), true, imgui.WindowFlags.VerticalScrollbar)
				imgui.Text(u8'� ���������� 0.4 Beta\n  - ��������� ����������� ������ ������ �� ��������� �������.\n    ��� ����� �������� ���� � ���������� ������.')
				imgui.NewLine()
				imgui.Text(u8'� ���������� 0.3 Beta\n  - �������� ��������� ����������\n  - ��������� ���� �������\n  - ��������� ���� ��������')
				imgui.NewLine()
				imgui.Text(u8'� ���������� 0.2 Beta\n  - ��������� ���������� ��� ���������� ����� � ������� ���������')
				imgui.NewLine()
				imgui.Text(u8'� ���������� 0.1 Beta\n  - ��������� ������� ������� ����������')
			imgui.EndChild()
        imgui.End()
    end
end

end
--[��������] � ����� Los Santos ��������� ������������
function sampev.onServerMessage(color, text)
	if string.find(text, "[��������]", 1, true) and string.find(text, "�����", 1, true) then
		bank_city = string.match(text, '����� (.+) �������� �������')
		sampAddChatMessage("{cc0000}----------------------------------------------------------------------------------------", 0xcc0000)
		sampAddChatMessage("{cc0000}��������! ���������� ���������� ����� ������ ".. bank_city ..".", 0xcc0000)
		sampAddChatMessage("{cc0000}----------------------------------------------------------------------------------------", 0xcc0000)
		printStyledString("~r~Bank of ~b~".. bank_city .." ~r~is robbed", 4000, 4)
		return false
	elseif string.find(text, "[��������]", 1, true) and string.find(text, "��������������", 1, true) then
		if not isGamePaused() then
			lua_thread.create(function()
				wait(500)
				sampAddChatMessage("[MoJ Helper]: {FFFFFF}������� {B22222}U{FFFFFF}, ����� ������������� �� ������ �������.", main_color)
				enable = 1
			end)
		end	
	end
	if string.find(text, "[��������]", 1, true) and string.find(text, "� �����", 1, true) then
		bank_city = string.match(text, '� ����� (.+) ��������� ������������')
		sampAddChatMessage("{cc0000}----------------------------------------------------------------------------------------", 0xcc0000)
		sampAddChatMessage("{cc0000}��������! ���������� ���������� ����� ������ ".. bank_city ..".", 0xcc0000)
		sampAddChatMessage("{cc0000}----------------------------------------------------------------------------------------", 0xcc0000)
		printStyledString("~r~Bank of ~b~".. bank_city .." ~r~is robbed", 4000, 4)
		return false	
		end
	if text:match('^%[F%] (.*) (.*)%[(%d+)%]: (.*)') then -- �������� ����� � /r, /f �����
		zvan, mynick, id,  text123 = text:match('^%[F%] (.*) (.*)%[(%d+)%]: (.*)')
		if mynick == 'Junior_Emerson' then
			sampAddChatMessage('{4682b4}[F] '..zvan..' {cc0000}'..mynick..'['..id..']: {4682b4}'..text123, 0x4682b4)
		elseif mynick == 'Adriano_Emerson' then
			sampAddChatMessage('{4682b4}[F] '..zvan..' {cc0000}'..mynick..'['..id..']: {4682b4}'..text123, 0x4682b4)
		else
			sampAddChatMessage('{4682b4}[F] '..zvan..' '..mynick..'['..id..']: '..text123, 0x4682b4)
		end
		return false
	end	
	if text:match('^%[R%] (.*) (.*)%[(%d+)%]: (.*)') then
		zvan, mynick, id,  text123 = text:match('^%[R%] (.*) (.*)%[(%d+)%]: (.*)')
		if mynick == 'Junior_Emerson' then
			sampAddChatMessage('{ace600}[R] '..zvan..' {cc0000}'..mynick..'['..id..']: {ace600}'..text123, 0xace600)
		elseif mynick == 'Adriano_Emerson' then
			sampAddChatMessage('{ace600}[R] '..zvan..' {cc0000}'..mynick..'['..id..']: {ace600}'..text123, 0xace600)
		else
			sampAddChatMessage('{ace600}[R] '..zvan..' '..mynick..'['..id..']: '..text123, 0xace600)
		end
			return false
	end
	if text:match('^%[Emerson Dynasty%] (.*)%[(%d+)%]: (.*)') then -- �������� ���� � /k ���
        mynick, id,  text1234 = text:match('^%[Emerson Dynasty%] (.*)%[(%d+)%]: (.*)')
        if mynick == 'Junior_Emerson' then
            sampAddChatMessage('{4C75B7}[Emerson Dynasty] {cc0000}'..mynick..'['..id..']:{FFCC99} '..text1234, 0xFFCC99)
        elseif mynick == 'Adriano_Emerson' then
            sampAddChatMessage('{4C75B7}[Emerson Dynasty] {cc0000}'..mynick..'['..id..']:{FFCC99} '..text1234, 0xFFCC99)
        else
            sampAddChatMessage('{4C75B7}[Emerson Dynasty] {FFCC99}'..mynick..'['..id..']: '..text1234, 0xFFCC99)
        end
        return false
    end
end

function cmd_mj()
	show_main_window.v = not show_main_window.v
	imgui.Process = show_main_window.v
end
function cmd_cuff(pid)
	if #pid == 0 then
			sampAddChatMessage("[MoJ Helper]: {FFFFFF}�������� /cuff [ID]", main_color)
	else
		lua_thread.create(function()
			sampSendChat("/me ��������� �� ��������������, �������� ��� ���� �� ������, ���� � ����� ���������, ��� ����� ...")
			sampSendChat("/cuff " .. pid)
		end)
	end
end
function cmd_ticket(arg)
    var1, var2, var3 = string.match(arg, "(.+) (.+) (.+)")
    if var1 == nil or var1 == "" then
        sampAddChatMessage("[MoJ Helper]: {FFFFFF}�������� /ticket [ID] [�����] [�������]", main_color)
    else
	lua_thread.create(function()
	sampSendChat("/todo ������ �� ���������*���������� ��������� � �������� ����� ��������.")
    wait(2000)
	sampSendChat("/ticket " .. var1.. " " .. var2.. " " .. var3.. " ")
    end)
	end
end
function cmd_arrest(pid)
if #pid == 0 then
		sampAddChatMessage("[MoJ Helper]: {FFFFFF}�������� /arrest [ID]", main_color)
	else
		lua_thread.create(function()
			sampSendChat("/todo ���������� ��������� ��� �������� �������������� � �������*����� �� ������� �����.")
			wait(2000)
			sampSendChat("/do ����� ��������� ����� � ����� ���������� ��������, �������� ��������, ������� �������������� � ����� � �������.")
			wait(1000)
			sampSendChat("/arrest " .. pid)
		end)
	end
end


function cmd_hold(pid)
	if #pid == 0 then
		sampAddChatMessage("[MoJ Helper]: {FFFFFF}�������� /hold [ID]", main_color)
	else
		lua_thread.create(function()
			sampSendChat("/me ������� �������� �� ���� �� ����������, ��� �����...")
			sampSendChat("/hold " .. pid)
		end)
	end	
end


function cmd_push(pid)
	if #pid == 0 then
		sampAddChatMessage("[MoJ Helper]: {FFFFFF}�������� /push [ID]", main_color)
	else
		lua_thread.create(function()
			sampSendChat("/me ��������� ����� ����������, �������� ������ ��������, ����� ����...")
			sampSendChat("/push " .. pid)
		end)
	end	
end


-----------------------------------------------------------------------------------
------------------------------- ����� � �������� ����� ----------------------------
-----------------------------------------------------------------------------------

-- ���� ����������� ���� alt+tab(������ ����� ��� �� ����� �� ����� � ���� ������ �� ������ ����� ��������� � ����)
writeMemory(0x555854, 4, -1869574000, true)
writeMemory(0x555858, 1, 144, true)

-- ������� �������� �������� ����, ������ ����� �����.. �� �����
function patch()
	if memory.getuint8(0x748C2B) == 0xE8 then
		memory.fill(0x748C2B, 0x90, 5, true)
	elseif memory.getuint8(0x748C7B) == 0xE8 then
		memory.fill(0x748C7B, 0x90, 5, true)
	end
	if memory.getuint8(0x5909AA) == 0xBE then
		memory.write(0x5909AB, 1, 1, true)
	end
	if memory.getuint8(0x590A1D) == 0xBE then
		memory.write(0x590A1D, 0xE9, 1, true)
		memory.write(0x590A1E, 0x8D, 4, true)
	end
	if memory.getuint8(0x748C6B) == 0xC6 then
		memory.fill(0x748C6B, 0x90, 7, true)
	elseif memory.getuint8(0x748CBB) == 0xC6 then
		memory.fill(0x748CBB, 0x90, 7, true)
	end
	if memory.getuint8(0x590AF0) == 0xA1 then
		memory.write(0x590AF0, 0xE9, 1, true)
		memory.write(0x590AF1, 0x140, 4, true)
	end
end
patch()