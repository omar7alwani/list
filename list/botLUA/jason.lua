-- BY : t.me/dev_jason | CH : t.me/dev_aleppo
local action = function(msg, matches, inline)
local jason = client:get('jason'..msg.from.id)
local allchjason = client:get('allchjason'..bot.id)
local edstart = client:get('edstart'..bot.id)
local jasonr = client:get('jasonr'..bot.id)
----------start---------------
if matches[1] == "start" then
	keyboard = {} 
	keyboard.inline_keyboard = {		
 		 {-- BY : t.me/dev_jason | CH : t.me/dev_aleppo
		 {text = "مشاركه في الدعم",callback_data='/setch'},					
		 },	  
  		 {
		 {text = "انشاء كود",callback_data='/addcode'},					
		 },
   		{
		 {text = "السورس",url='https://github.com/jasonbot/dev_aleppo'},					
		 },
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
    	}
 api.sendKeyboard(msg.chat.id, (edstart or 'no text'), keyboard)    
 client:set('jason'..msg.from.id, 'end')    
 end
if msg.cb then 
 if matches[1] == "addcode" then
 keyboard = {} 
 keyboard.inline_keyboard = {		
        {
		{text = "صوره + وصف",callback_data='/photocode'}-- BY : t.me/dev_jason | CH : t.me/dev_aleppo,					
		},
        {
		{text = "مارك",callback_data='/markcode'},					
		},
        {
		{text = "شفاف",callback_data='/listcode'},					
		},	
        {
		{text = "رجوع",callback_data='/reend'},					
		},
	}
 api.editMessageText(msg.chat.id, msg.message_id, 'اختر الان نوع الكود', keyboard)      
 client:set('jason'..msg.from.id, 'end')    
 end
 end
if msg.cb then 
 if matches[1] == "reend" then
	keyboard = {} 
	keyboard.inline_keyboard = {		
 		{
		{text = "مشاركه في الدعم",callback_data='/setch'},					
		},	  
  	{
		{text = "انشاء كود",callback_data='/addcode'},					
		},-- BY : t.me/dev_jason | CH : t.me/dev_aleppo,		
   	{
		{text = "السورس",url='https://github.com/jasonbot/dev_aleppo'},					
		},
		{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
		},		
    }
 api.editMessageText(msg.chat.id, msg.message_id, (edstart or 'no text'), keyboard)      
 client:set('jason'..msg.from.id, 'end')    
  end
  end
if msg.cb then 
if matches[1] == "markcode" then
 	keyboard = {} 
	keyboard.inline_keyboard = {		
    {
	{text = "رجوع",callback_data='/addcode'},					
	},	
	}
   api.editMessageText(msg.chat.id, msg.message_id, 'لان ارسال :\n [text](link)\n او \n [dev_aleppo](https://t.me/dev_aleppo)', keyboard)      
   client:set('jason'..msg.from.id, 'markcode')    
  end
  end
if jason == 'markcode' then 
 if msg.cd then return false end		
 if msg.text then 
 client:set('jason'..msg.from.id, 'end')    
 client:set('code'..'mark'..bot.id..msg.from.id..msg.message_id, msg.text)    
 api.sendReply(msg, 'الكود الخاص الكليشه : \n `'..'mark_'..bot.id..msg.from.id..msg.message_id..'`', true)
 end
end  -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
if msg.cb then 
 if matches[1] == "photocode" then
 	keyboard = {} 
	keyboard.inline_keyboard = {		
       {
		{text = "رجوع",callback_data='/addcode'},					
		},	-- BY : t.me/dev_jason | CH : t.me/dev_aleppo
	}
   api.editMessageText(msg.chat.id, msg.message_id, 'الان قم رسال وصف الصوره', keyboard)      
   client:set('jason'..msg.from.id, 'photocode1')    
  end
  end
if jason == 'photocode1' then 
if msg.cd then return false end		
if msg.text then 
 client:set('jason'..msg.from.id, 'photocode1p')    
 client:set('photocodep'..msg.from.id, 'photo_'..bot.id..msg.from.id..msg.message_id)    
 client:set('code'..'photo_'..bot.id..msg.from.id..msg.message_id, msg.text)    
 api.sendReply(msg, 'ارسال الان الصوره', true)
 end
 end
if jason == 'photocode1p' then 
 if msg.photo then
 client:set('jason'..msg.from.id, 'end')    
local photocodep = client:get('photocodep'..msg.from.id)
client:set('codep'..photocodep, msg.photo[3].file_id)    
api.sendReply(msg, 'الكود الخاص بالصوره : \n `'..photocodep..'`', true)
end
return false end
if msg.cb then 
 if matches[1] == "listcode" then
 	keyboard = {} 
	keyboard.inline_keyboard = {		
       {
		{text = "رجوع",callback_data='/addcode'},					
			},	
	}
   api.editMessageText(msg.chat.id, msg.message_id, 'ارسال الان نص فوق الازرار', keyboard)      
   client:set('jason'..msg.from.id, 'listcode')    
  end
  end  -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
if jason == 'listcode' then 
if msg.cd then return false end		
client:set('jason'..msg.from.id, 'listcode1')    
client:set('listcode'..msg.chat.id, msg.text)    
api.sendReply(msg, 'الان قم برسال الرابط + نص الزر\n\nمثال : \nhttps://t.me/dev_jason jason', true)
end  
if jason == 'listcode1' then 
if matches[1] == 'http'then -- BY : t.me/dev_jason | CH : t.me/dev_aleppo,		
if msg.cd then return false end	
if matches[1] == "send" then return false end	
client:set('list1'..msg.chat.id, matches[3])
client:set('list1u'..msg.chat.id, matches[1]..matches[2])
 	keyboard = {} 
	keyboard.inline_keyboard = {		
  {
	{text = "رجوع ",callback_data='/addcode'},					
	},	
  {
	{text = "انهاء",callback_data='/getcod'},					
	},	-- BY : t.me/dev_jason | CH : t.me/dev_aleppo
	}
 api.sendKeyboard(msg.chat.id, 'يمكنك اضافه المزيد من الازرار او النهاء للحصول على كود', keyboard)  
 client:set('jason'..msg.from.id, 'listcode2')    
  end -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
  end
if jason == 'listcode2' then 
if matches[1] == 'http'then
if msg.cd then return false end	
if matches[1] == "send" then return false end	
client:set('list2'..msg.chat.id, matches[3])
client:set('list2u'..msg.chat.id, matches[1]..matches[2])
 	keyboard = {} 
	keyboard.inline_keyboard = {		 -- BY : t.me/dev_jason | CH : t.me/dev_aleppo,		
    {
		{text = "رجوع ",callback_data='/addcode'},					
		},	
    {
		{text = "انهاء",callback_data='/getcod'},					
		},	
	}
 api.sendKeyboard(msg.chat.id, 'يمكنك اضافه المزيد من الازرار او النهاء للحصول على كود', keyboard)  
 client:set('jason'..msg.from.id, 'listcode3')    
  end 
  end
if jason == 'listcode3' then 
if matches[1] == 'http'then
if msg.cd then return false end	
if matches[1] == "send" then return false end	
client:set('list3'..msg.chat.id, matches[3])
client:set('list3u'..msg.chat.id, matches[1]..matches[2])
 			keyboard = {} 
	keyboard.inline_keyboard = {		
       {
		{text = "رجوع ",callback_data='/addcode'},					
			},	
       {
		{text = "انهاء",callback_data='/getcod'},					
			},	
	}
  api.sendKeyboard(msg.chat.id, 'يمكنك اضافه المزيد من الازرار او النهاء للحصول على كود', keyboard)  
 client:set('jason'..msg.from.id, 'listcode4')    
  end 
  end
if jason == 'listcode4' then 
if matches[1] == 'http'then
if msg.cd then return false end	
if matches[1] == "send" then return false end	
client:set('list3'..msg.chat.id, matches[3])
client:set('list3u'..msg.chat.id, matches[1]..matches[2])
 			keyboard = {} 
	keyboard.inline_keyboard = {		
       {
		{text = "رجوع ",callback_data='/addcode'},					
			},	
       {
		{text = "انهاء",callback_data='/getcod'},			 -- BY : t.me/dev_jason | CH : t.me/dev_aleppo,				
			},	
	}
 api.sendKeyboard(msg.chat.id, 'يمكنك اضافه المزيد من الازرار او النهاء للحصول على كود', keyboard)  
 client:set('jason'..msg.from.id, 'listcode5')    
  end 
  end
if jason == 'listcode5' then 
if matches[1] == 'http' then
if msg.cd then return false end	
if matches[1] == "send" then return false end	
client:set('list3'..msg.chat.id, matches[3])
client:set('list3u'..msg.chat.id, matches[1]..matches[2])
 	keyboard = {} 
	keyboard.inline_keyboard = {			
       {
		{text = "انهاء",callback_data='/getcod'},					
			},	-- BY : t.me/dev_jason | CH : t.me/dev_aleppo,		
	 }
  api.sendKeyboard(msg.chat.id, 'يمكنك النهاء للحصول على كود', keyboard)  
 client:set('jason'..msg.from.id, 'end')    
   end 
  end -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
if msg.cb then 
if matches[1] == "getcod" then
local id = msg.chat.id
local text = client:get('listcode'..id)
local list1 = client:get('list1'..id)
local list1u = client:get('list1u'..id)
local list2 = client:get('list2'..id) -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
local list2u = client:get('list2u'..id)
local list3 = client:get('list3'..id)
local list3u = client:get('list3u'..id)
local list4 = client:get('list4'..id)
local list4u = client:get('list4u'..id)
local list5 = client:get('list5'..id)
local list5u = client:get('list5u'..id)
if list1 then 
client:set('code1'..'list'..bot.id..msg.from.id..msg.message_id, list1)    
client:set('code1u'..'list'..bot.id..msg.from.id..msg.message_id, list1u)   
end
if list2 then 
client:set('code2'..'list'..bot.id..msg.from.id..msg.message_id, list2)    
client:set('code2u'..'list'..bot.id..msg.from.id..msg.message_id, list2u) 
end
if list3 then 
client:set('code3'..'list'..bot.id..msg.from.id..msg.message_id, list3)    
client:set('code3u'..'list'..bot.id..msg.from.id..msg.message_id, list3u)  
end
if list4 then 
client:set('code4'..'list'..bot.id..msg.from.id..msg.message_id, list4)    
client:set('code4u'..'list'..bot.id..msg.from.id..msg.message_id, list4u)   
end
if list5 then -- BY : t.me/dev_jason | CH : t.me/dev_aleppo,		
client:set('code5'..'list'..bot.id..msg.from.id..msg.message_id, list5)    
client:set('code5u'..'list'..bot.id..msg.from.id..msg.message_id, list5u)    
end
client:set('codetext'..'list'..bot.id..msg.from.id..msg.message_id, text)    
 	keyboard = {} 
	keyboard.inline_keyboard = {		
       {
		{text = "رجوع",callback_data='/addcode'},					
			},	
	}
   api.editMessageText(msg.chat.id, msg.message_id, 'الكود الخص بالسته : \n list_'..bot.id..msg.from.id..msg.message_id, keyboard)      
   client:set('jason'..msg.from.id, 'end')    
  end
  end -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
if is_admin(msg) then	
  if matches[1] == "start" then
			keyboard = {} 
	keyboard.inline_keyboard = {		
 			{
		{text = "نشر منشور",callback_data='/send'},					
			},	    
       {
		{text = "القنوات",callback_data='/chhanl'},					
			},	
      {
		{text = "تعين عدد اعضاء القنات ",callback_data='/addr'},					
			},	
      {
		{text = "تغير رساله start",callback_data='/edstart'},					
			},
        {
		{text = "فحص",callback_data='/jason'},					
			},	
       {
		{text = "معلومات القنوات",callback_data='/kek'},					
			},	-- BY : t.me/dev_jason | CH : t.me/dev_aleppo,		
       {
 		{text = "نشر لسته تحتوي على جميع القنوات",callback_data='/sundalllist'},					
			},
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
    	}
		api.sendKeyboard(msg.chat.id, 'مرحبا بك في بوت دعم الخاص بjason يمكنك اداره الدعم الخاص بك بكل سهوله ', keyboard)    
   client:set('jason'..msg.from.id, 'end')    
	  end
end
if msg.cb then
if matches[1] == 'sundalllist' then 
			keyboard = {} 
	keyboard.inline_keyboard = {		
 			{
		{text = "رجوع",callback_data='/home'},					
			},	    
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
    	}
api.editMessageText(msg.chat.id, msg.message_id, 'الان قم برسال النص الذي سيضهر فوق لسته القنوات', keyboard)     
client:set('jason'..msg.from.id, 'listall')        
end
end
if not msg.cb then -- BY : t.me/dev_jason | CH : t.me/dev_aleppo,		
if jason == 'listall' then 
if matches[1] ~= 'start' then 
    client:set('jason'..msg.from.id, 'end')      
    local text = msg.text..'\n'
    local users = client:smembers('jason'..bot.id)
    for i=1, #users do
    local jasonch = client:get('jasonch'..bot.id..''..users[i])
    if jasonch == 'yes' then
    local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/getChat?chat_id='..users[i]..''
    local res = HTTPS.request(url)
    local jres = JSON.decode(res)	
    if jres.result then 
    text = text..i..' - ['..jres.result.title..'](https://t.me/'..(jres.result.username or 'dev_aleppo')..') \n'
end	     
end
end  
    for i=1, #users do
    local jasonch = client:get('jasonch'..bot.id..''..users[i])
    if jasonch == 'yes' then
    local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/sendMessage?chat_id='..users[i]..'&text='..URL.escape(text)..'&parse_mode=Markdown&disable_web_page_preview=true'
    local res = HTTPS.request(url)
    local jres = JSON.decode(res)	
    if not jres.result then    api.sendReply(msg, 'قامه بالمخالفة '..users[1])  end 
    if jres.result then 
    local id = jres.result.message_id
    client:sadd('idjason'..bot.id..''..msg.message_id, '/deleteMessage?chat_id='..users[i]..'&message_id='..id) 
    end
    end
    end
	keyboard = {} 
	keyboard.inline_keyboard = {		
 			{
		{text = 'حذف من جميع القنوات',callback_data='/dele'..msg.message_id..''},					
			},	       
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
    	}
	api.sendKeyboard(msg.chat.id, 'تم نشر النص بنجاح يمكنك الضغط وسينم حذف النص', keyboard)   
    client:set('jason'..msg.from.id, 'end')      
end
end
end
-- BY : t.me/dev_jason | CH : t.me/dev_aleppo
 if msg.cb then 
 if matches[1] == "jason" then
 api.editMessageText(msg.chat.id, msg.message_id, 'جاري الفحص')    
 local users = client:smembers('jason'..bot.id)
		for i=1, #users do
    local jasonch = client:get('jasonch'..bot.id..''..users[i])
    if jasonch == 'yes' then
   local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/getChatMember?chat_id='..users[i]..'&user_id='..bot.id..''
    local res = HTTPS.request(url)
    local jres = JSON.decode(res)	
    if jres.result.status ~= 'administrator'  then 
    api.sendReply(msg, 'قام بالمخالفه \n '..users[i])
   client:set('jasonch'..bot.id..''..users[i], 'no')    
   client:decrby('allchjason'..bot.id, 1)              
   end	     
end
end
 api.editMessageText(msg.chat.id, msg.message_id, 'تم الفحص')    
end
end
if msg.cb then 
 if matches[1] == "kek" then
 api.editMessageText(msg.chat.id, msg.message_id, 'جاري الارسال')    
    local users = client:smembers('jason'..bot.id)
		for i=1, #users do
    local jasonch = client:get('jasonch'..bot.id..''..users[i])
    if jasonch == 'yes' then
    local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/getChat?chat_id='..users[i]..''
    local res = HTTPS.request(url)
    local jres = JSON.decode(res)	
    if jres.result then 
    api.sendReply(msg, 'ايدي القنات : '..users[i]..'\n معرف القنات : @'..(jres.result.username or "لا يوجد")..'\n اسم القنات : '..jres.result.title)
 end	     
end
end
 api.editMessageText(msg.chat.id, msg.message_id, 'تم')    
end
end -- BY : t.me/dev_jason | CH : t.me/dev_aleppo,		
if msg.cb then 
if matches[1] == "dele" then
			keyboard = {} 
	keyboard.inline_keyboard = {		
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
	} -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
   api.editMessageText(msg.chat.id, msg.message_id, 'جاري الحذف', keyboard)
    local users = client:smembers('idjason'..bot.id..''..matches[2])
		for i=1, #users do
    local url = 'https://api.telegram.org/bot'..config.bot_api_key..''..users[i]
    HTTPS.request(url)
    end
    api.editMessageText(msg.chat.id, msg.message_id, 'تم الحذف من جميع القنوات')
  return false end		  
  end		  
if msg.cb then 
if matches[1] == "setch" then
api.editMessageText(msg.chat.id, msg.message_id, 'قم بعمل توجيه من القنات الى البوت ')
client:set('jason'..msg.from.id, 'setch')    
  end  
  end     -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
if jason == 'setch' then
if msg.cd then return false end		
if not msg.forward_from_chat then return false end		
local id = msg.forward_from_chat.id
 local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/getChatMember?chat_id='..id..'&user_id='..msg.from.id..''
 local res = HTTPS.request(url)
 local jres = JSON.decode(res)	
 if not jres.result then api.sendReply(msg, '`البوت ليس ادمن في لقنات`', true)  return false end	      
 local url2 = 'https://api.telegram.org/bot'..config.bot_api_key..'/getChatMembersCount?chat_id='..id
 local res2 = HTTPS.request(url2)
 local jres2 = JSON.decode(res2)	
 if not (tonumber(jres2.result) > tonumber((jasonr or 1000))) then api.sendReply(msg, 'عدد اعضاء القنات قليل يجب ان يكون '..jasonr, true)  return false end	      
 api.sendReply(msg, 'ارسال الان الكليشه التي تريد المشاركه بها \nاو الكود الخاص بك ', true)   
 client:set('jason'..msg.from.id, 'list')    
 client:set('jasoniid'..bot.id..''..msg.from.id, id)    
end
if jason == 'list' then
if msg.cd then return false end		
  local id = client:get('jasoniid'..bot.id..''..msg.chat.id)
 api.sendMessage(config.admin, 'ايدي قناته : '..id..'')
 api.sendReply(msg, 'تم ارسال طلبك الى مدير الدعم نتضر رجا', true)   
 api.forwardMessage(config.admin, msg.chat.id, msg.message_id)
	keyboard = {} 
	keyboard.inline_keyboard = {		
 			{
		{text = "موافق",callback_data='/yess'..msg.chat.id..''},					
		{text = "رفض",callback_data='/noo'..msg.chat.id..''},					
			},	  
 			{
		{text = ''..msg.from.first_name..'',url='https://t.me/'..(msg.from.username or 'no')..''},					
			}
    	}
		api.sendKeyboard(config.admin, 'يريد المستخدم مشاركه في الدعم كليشه الخاصه به', keyboard)    
client:set('jason'..msg.from.id, 'end')    
   end
if msg.cb then 
if matches[1] == "yess" then
local id = client:get('jasoniid'..bot.id..''..matches[2])
api.editMessageText(msg.chat.id, msg.message_id, 'تم الموافقه بنجاح')
api.sendReply(msg, 'تم اضافت '..id..' \n الى الدعم', true)   
client:sadd('jason'..bot.id, id) 
client:set('jasonch'..bot.id..''..id, 'yes')    
client:incrby('allchjason'..bot.id, 1)
client:set('jason'..msg.from.id, 'end')    
	keyboard = {} 
	keyboard.inline_keyboard = {		
 			{
		{text = "تمت اضافتك الى الدعم بنجاح",callback_data='ععععععععععععععععععععع'},					
			},	  
    	} -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
		api.sendKeyboard(matches[2], 'تمت اضافتك الى الدعم بنجاح', keyboard) 
   end
end
if msg.cb then 
if matches[1] == "noo" then
local id = client:get('jasoniid'..bot.id..''..matches[2])
api.editMessageText(msg.chat.id, msg.message_id, 'تم االرفض بنجاح')
client:set('jason'..msg.from.id, 'end')    
	keyboard = {} 
	keyboard.inline_keyboard = {		
 			{
		{text = "تم رفض طلبك ",callback_data='ععععععععععععععععععععع'},					
			},	  
    	}
		api.sendKeyboard(matches[2], 'لم يتم الموافقه على طلبك', keyboard) 
   end 
end -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
if is_admin(msg) then 
 if msg.cb then 
 if matches[1] == "edstart" then
 	keyboard = {} 
	keyboard.inline_keyboard = {		
      {
		{text = "رجوع",callback_data='/home'},					
			},
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
	}
   api.editMessageText(msg.chat.id, msg.message_id, 'اراسل الان الرساله التي تريد ان تضعر في start', keyboard)
client:set('jason'..msg.from.id, 'edstart')    
  end  
  end
  if jason == 'edstart' then 
  if msg.cd then return false end
  if msg.text == '###cb:/home' then return false end
  client:set('jason'..msg.from.id, 'end')    
  client:set('edstart'..bot.id, msg.text)    
  api.sendReply(msg, 'تم تعين '..msg.text..'\n نص start', true)    
  client:set('jason'..msg.from.id, 'end')    
  end     
end
if msg.cb then 
  if matches[1] == "addr" then
 	keyboard = {} 
	keyboard.inline_keyboard = {		
      {
		{text = "رجوع",callback_data='/home'},					
			},
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
	}
   api.editMessageText(msg.chat.id, msg.message_id, 'قم برسال عدد العضاء المطلوب للمشاركه في الدعم', keyboard)
client:set('jason'..msg.from.id, 'addr')    
  end  
  end
if jason == 'addr' then 
  if msg.cd then return false end		
   client:set('jasonr'..bot.id, msg.text)    
  api.sendReply(msg, 'تم تمعين '..msg.text..'\n عدد لشتراك قنوات ', true)    
client:set('jason'..msg.from.id, 'end')    
  end     
if msg.cb then 
 if matches[1] == "chhanl" then
			keyboard = {} 
	keyboard.inline_keyboard = {		
 			{
		{text = "اضافه قنات",callback_data='/addch'},		
		{text = "حذف قنات",callback_data='/unaddch'},					
			},	    
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
    	}
   api.editMessageText(msg.chat.id, msg.message_id, 'عدد القنوات المشاركة في الدعم : '..(allchjason or '0')..'', keyboard)
client:set('jason'..msg.from.id, 'end')    
  end  
  end
if msg.cb then 
if matches[1] == "home" then
			keyboard = {} 
	keyboard.inline_keyboard = {		
 			{
		{text = "نشر منشور",callback_data='/send'},					
			},	    
       {
		{text = "القنوات",callback_data='/chhanl'},					
			},	
      {
		{text = "تعين عدد اعضاء القنات ",callback_data='/addr'},					
			},	 -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
      {
		{text = "تغير رساله start",callback_data='/edstart'},					
			},
        {
		{text = "فحص",callback_data='/jason'},					
			},	
       {
		{text = "معلومات القنوات",callback_data='/kek'},					
			},	
       {
 		{text = "نشر لسته تحتوي على جميع القنوات",callback_data='/sundalllist'},					
			},
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
    	}
   api.editMessageText(msg.chat.id, msg.message_id, 'مرحبا بك في بوت دعم الخاص بjason يمكنك اداره الدعم الخاص بك بكل سهوله  ', keyboard)
client:set('jason'..msg.from.id, 'end')    
  end  
  end    
if msg.cb then 
if matches[1] == "addch" then
 			keyboard = {} 
	keyboard.inline_keyboard = {		
       {
		{text = "رجوع",callback_data='/home'},					
			},	
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
	}
   api.editMessageText(msg.chat.id, msg.message_id, 'قم بعمل توجيه من القنات الى البوت لمنشور', keyboard)
client:set('jason'..msg.from.id, 'addch')    
  end  
  end    
if jason == 'addch' then
if msg.cd then return false end		 -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
if not msg.forward_from_chat then return false end		
local id = msg.forward_from_chat.id
 local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/getChatMember?chat_id='..id..'&user_id='..msg.from.id..''
 local res = HTTPS.request(url)
 local jres = JSON.decode(res)	
if not jres.result then api.sendReply(msg, '`البوت ليس ادمن في لقنات`', true)  return false end	      
api.sendReply(msg, '`تم اضافت `'..id..' \n الى الدعم', true)   
client:sadd('jason'..bot.id, id) 
client:set('jason'..msg.chat.id, 'end')   
client:set('jasonch'..bot.id..''..id, 'yes')    
client:incrby('allchjason'..bot.id, 1)
end
if msg.cb then 
if matches[1] == "unaddch" then
 			keyboard = {} 
	keyboard.inline_keyboard = {		
       {
		{text = "رجوع",callback_data='/home'},					
			},	 -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
	}
   api.editMessageText(msg.chat.id, msg.message_id, 'قم بعمل توجيه من القنات الى البوت لمنشور', keyboard)
client:set('jason'..msg.from.id, 'unaddch')    
  end  
  end    
if jason == 'unaddch' then
if msg.cd then return false end		
if not msg.forward_from_chat then return false end		
local id = msg.forward_from_chat.id
 local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/getChatMember?chat_id='..id..'&user_id='..msg.from.id..''
 local res = HTTPS.request(url)
 local jres = JSON.decode(res)	
if not jres.result then api.sendReply(msg, '`البوت ليس ادمن في القنات`', true)  return false end	      
api.sendReply(msg, 'تم حذف '..id, true)   
client:set('jasonch'..bot.id..''..id, 'no')    
client:set('jason'..msg.chat.id, 'end')   
client:decrby('allchjason'..bot.id, 1)
end
if msg.cb then 
if matches[1] == "send" then
    client:set('jason'..msg.from.id, 'end')    
 			keyboard = {} 
	keyboard.inline_keyboard = {		
 			{
		{text = "نشر توجيه",callback_data='/fwdsend'},					
		{text = "نشر نص مباشر",callback_data='/textsend'},					
			},	     
      {
		{text = "نشر مارك (لنك)",callback_data='/marksend'},					
        },
         {
		{text = "نشر صور",callback_data='/photo'},					
        },
         {
		{text = "نشر شفاف",callback_data='/kaysend'},					
        },
       {
		{text = "رجوع",callback_data='/home'},					
			},	
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
	}
   api.editMessageText(msg.chat.id, msg.message_id, 'ختر طريقة النشر\n يمكنك نشر كود عن طريق :\n /send code \nاو /send wef3refrwafesfwfw', keyboard)
client:set('jason'..msg.from.id, 'end')    
  end  
  end -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
if not msg.cd then 
if is_admin(msg) then	
if matches[1] == 'send' and matches[2] == 'photo' then
    client:set('jason'..msg.from.id, 'end')    
		api.sendReply(msg, 'نتضر رجا حتا يتم نشر في القنوات', true)
    local users = client:smembers('jason'..bot.id)
    local kkekko = client:get('code'..matches[2]..'_'..matches[3])
    local photo = client:get('codep'..matches[2]..'_'..matches[3])
		for i=1, #users do
    local jasonch = client:get('jasonch'..bot.id..''..users[i])
    if jasonch == 'yes' then
    local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/sendPhoto?chat_id='..users[i] ..'&photo='..photo..'&caption='..kkekko
    local res = HTTPS.request(url)
    local jres = JSON.decode(res)	
    if not jres.result then    api.sendReply(msg, 'قامه بالمخالفة '..users[1])  end 
	  if jres.result then 
    local id = jres.result.message_id
    client:sadd('idjason'..bot.id..''..msg.message_id, '/deleteMessage?chat_id='..users[i]..'&message_id='..id) 
    client:set('jason'..msg.from.id, 'end')    
    end
    end
    end
  	keyboard = {} 
	  keyboard.inline_keyboard = {		
 			{
		{text = 'حذف من جميع القنوات',callback_data='/dele'..msg.message_id..''},					
			},	       
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
    	}
	api.sendKeyboard(msg.chat.id, 'تم نشر المنشور بنجاح يمكنك الضغط وسينم حذف النص', keyboard)   
  client:set('jason'..msg.chat.id, 'end')    
	 return false end	
if (matches[1] == 'send' and matches[2] == 'mark') then
    client:set('jason'..msg.from.id, 'end')    
 		api.sendReply(msg, 'نتضر رجا حتا يتم نشر المنشور في القنوات', true)
    local users = client:smembers('jason'..bot.id)
   local jasontext = client:get('code'..matches[2]..''..matches[3]..'')
		for i=1, #users do
    local jasonch = client:get('jasonch'..bot.id..''..users[i])
    if jasonch == 'yes' then
    local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/sendMessage?chat_id='..users[i]..'&text='..URL.escape(jasontext)..'&parse_mode=Markdown&disable_web_page_preview=true'
    local res = HTTPS.request(url)
    local jres = JSON.decode(res)	 -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
  if not jres.result then    api.sendReply(msg, 'قامه بالمخالفة '..users[1])  end 
	if jres.result then 
    local id = jres.result.message_id
    client:sadd('idjason'..bot.id..''..msg.message_id, '/deleteMessage?chat_id='..users[i]..'&message_id='..id) 
 client:set('jason'..msg.from.id, 'end')    
    end
    end
    end
	keyboard = {} 
	keyboard.inline_keyboard = {		
 			{
		{text = 'حذف من جميع القنوات',callback_data='/dele'..msg.message_id..''},					
			},	       
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
    	}
	api.sendKeyboard(msg.chat.id, 'تم نشر النص بنجاح يمكنك الضغط وسينم حذف النص', keyboard)   
  client:set('jason'..msg.chat.id, 'end')    
	 return false end	 
if not msg.cb then 
if matches[1] == 'send' then
 if matches[2] == 'list' then
    local list1 = client:get('code1'..matches[2]..matches[3])
    local list1u = client:get('code1u'..matches[2]..matches[3])
    local list2 = client:get('code2'..matches[2]..matches[3])
    local list2u = client:get('code2u'..matches[2]..matches[3])
    local list3 = client:get('code3'..matches[2]..matches[3])
    local list3u = client:get('code3u'..matches[2]..matches[3]) 
    local list4 = client:get('code4'..matches[2]..matches[3])
    local list4u = client:get('code4u'..matches[2]..matches[3])
    local list5 = client:get('code5'..matches[2]..matches[3])
    local list5u = client:get('code5u'..matches[2]..matches[3])
    local codetext = client:get('codetext'..matches[2]..matches[3])
  api.sendReply(msg, 'نتضر رجا حتا يتم نشر المنشور في القنوات', true)
 local jasonke = codetext
 local users = client:smembers('jason'..bot.id)
 local keyboard = ''
 if list1 then 
 keyboard = {}
 	keyboard.inline_keyboard = {		
{{text = list1, url= list1u},},
{{text = "BOT LUA®", url="https://t.me/dev_aleppo"},},		
	}       
 end
if list2 then  -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
 keyboard = {}
 	keyboard.inline_keyboard = {		
{{text = list1, url= list1u},},
{{text = list2, url= list2u},},
{{text = "BOT LUA®", url="https://t.me/dev_aleppo"},},		
	}       
 end
if list3 then 
 keyboard = {}
 	keyboard.inline_keyboard = {		
{{text = list1, url= list1u},},
{{text = list2, url= list2u},},	
{{text = list3, url= list3u},},	
{{text = "BOT LUA®", url="https://t.me/dev_aleppo"},},		 
}       
 end
if list4 then 
 keyboard = {}
 	keyboard.inline_keyboard = {		
{{text = list1, url= list1u},}, -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
{{text = list2, url= list2u},},	
{{text = list3, url= list3u},},	
{{text = list4, url= list4u},},	
{{text = "BOT LUA®", url="https://t.me/dev_aleppo"},},		        
}       
 end
if list5 then 
 keyboard = {}
 	keyboard.inline_keyboard = {		
{{text = list1, url= list1u},},
{{text = list2, url= list2u},},	
{{text = list3, url= list3u},},	
{{text = list4, url= list4u},},	
{{text = list5, url= list5u},},	      -- BY : t.me/dev_jason | CH : t.me/dev_aleppo  
{{text = "BOT LUA®", url="https://t.me/dev_aleppo"},},		
}            
 end
 for i=1, #users do
    local jasonch = client:get('jasonch'..bot.id..''..users[i])
    if jasonch == 'yes' then
    local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/sendMessage?chat_id='..users[i] 
   url = url..'&text='..URL.escape(jasonke)
	 url = url .. '&disable_web_page_preview=true'
	 url = url..'&reply_markup='..JSON.encode(keyboard)
    local res = HTTPS.request(url)
    local jres = JSON.decode(res)	
   if not jres.result then    api.sendReply(msg, 'قامه بالمخالفة  '..users[1])  end 
	 if jres.result then 
   local id = jres.result.message_id
   client:sadd('idjason'..bot.id..''..msg.message_id, '/deleteMessage?chat_id='..users[i]..'&message_id='..id) 
   client:set('jason'..msg.from.id, 'end')  
    end
    end
    end
end
	keyboard = {} 
	keyboard.inline_keyboard = {		
 			{
		{text = 'حذف من جميع القنوات',callback_data='/dele'..msg.message_id..''},					
			},	       
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
    	}
	api.sendKeyboard(msg.chat.id, 'تم نشر المنشور بنجاح يمكنك الضغط وسينم حذف النص', keyboard)   
  client:set('jason'..msg.chat.id, 'end')    
	 return false end	
   end
   end
if msg.cb then 
if matches[1] == "photo" then
 			keyboard = {} 
	keyboard.inline_keyboard = {		
       {
		{text = "رجوع",callback_data='/send'},					
			},	
			{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
			},		
	}
   api.editMessageText(msg.chat.id, msg.message_id, ' اراسال الان وصف الصوره', keyboard)
client:set('jason'..msg.from.id, '1photo1')    
  end  -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
  end
if jason == '1photo1' then 
 if msg.cd then return false end	
if matches[1] == "send" then return false end	 
api.sendReply(msg, 'ارسال الان الصوره .', true)
client:set('jason'..msg.from.id, 'photo')    
client:set('photo'..msg.from.id, msg.text)    
end
if jason == 'photo' then 
if msg.photo then
if msg.cd then return false end	
if matches[1] == "send" then return false end	 
    client:set('jason'..msg.from.id, 'end')    
		api.sendReply(msg, 'نتضر رجا حتا يتم نشر في القنوات', true)
    local users = client:smembers('jason'..bot.id)
    local kkekko = client:get('photo'..msg.from.id)
 for i=1, #users do
 local jasonch = client:get('jasonch'..bot.id..''..users[i])
 if jasonch == 'yes' then
 local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/sendPhoto?chat_id='..users[i] ..'&photo='..msg.photo[3].file_id..'&caption='..kkekko
 local res = HTTPS.request(url)
 local jres = JSON.decode(res)	
 if not jres.result then    api.sendReply(msg, 'قامه بالمخالفة '..users[1])  end 
 if jres.result then 
 local id = jres.result.message_id
 client:sadd('idjason'..bot.id..''..msg.message_id, '/deleteMessage?chat_id='..users[i]..'&message_id='..id) 
 client:set('jason'..msg.from.id, 'end')    
 end
 end
 end
 keyboard = {} 
 keyboard.inline_keyboard = {		
 {
 {text = 'حذف من جميع القنوات',callback_data='/dele'..msg.message_id..''},					
 },	       
 {
 {text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
 },		-- BY : t.me/dev_jason | CH : t.me/dev_aleppo
 }
 api.sendKeyboard(msg.chat.id, 'تم نشر المنشور بنجاح يمكنك الضغط وسينم حذف النص', keyboard)   
 client:set('jason'..msg.chat.id, 'end')    
 end
 end
if msg.cb then 
if matches[1] == "fwdsend" then
 keyboard = {} 
 keyboard.inline_keyboard = {		
 {
 {text = "رجوع",callback_data='/send'},					
 },	
 {
 {text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
 },		
 }
 api.editMessageText(msg.chat.id, msg.message_id, 'ارسال الان المنشور ليتم اعادة توجيه الى القنوات', keyboard)
client:set('jason'..msg.from.id, 'sendfwd')    
 end  
 end
 if jason == 'sendfwd' then 
 if msg.cd then return false end	
 if matches[1] == "send" then return false end	 
 api.sendReply(msg, 'نتضر رجا حتا يتم نشر المنشور في القنوات', true)
 local users = client:smembers('jason'..bot.id)
 for i=1, #users do
 local jasonch = client:get('jasonch'..bot.id..''..users[i])
 if jasonch == 'yes' then
 local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/forwardMessage?chat_id='..users[i] ..'&from_chat_id='..msg.chat.id..'&message_id='..msg.message_id
 local res = HTTPS.request(url)
 local jres = JSON.decode(res)	
 if not jres.result then    api.sendReply(msg, 'قامه بالمخالفة '..users[1])  end 
 if jres.result then 
 local id = jres.result.message_id
 client:sadd('idjason'..bot.id..''..msg.message_id, '/deleteMessage?chat_id='..users[i]..'&message_id='..id) 
 client:set('jason'..msg.from.id, 'end')    
 end
 end
 end
  	keyboard = {} 
	keyboard.inline_keyboard = {		
 		{
		{text = 'حذف من جميع القنوات',callback_data='/dele'..msg.message_id..''},					
		},	       -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
		{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
		},		
    	}
 api.sendKeyboard(msg.chat.id, 'تم نشر المنشور بنجاح يمكنك الضغط وسينم حذف النص', keyboard)   
 client:set('jason'..msg.chat.id, 'end')    
 end
-----------end---------
if msg.cb then 
if matches[1] == "kaysend" then
    keyboard = {} 
	keyboard.inline_keyboard = {		
     {
     {text = "رجوع",callback_data='/send'},					
     },	
     {
     {text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
     },		
	 }
api.editMessageText(msg.chat.id, msg.message_id, 'الان قم برسال اسم الاساسي', keyboard)
client:set('jason'..msg.from.id, 'skaysend')    
end  
end
end
-----------end---------
if jason == 'skaysend' then 
if msg.cd then return false end
if matches[1] == "send" then return false end	
api.sendReply(msg, 'الان قم برسال الرابط + نص الزر\n\nمثال : \nhttps://t.me/dev_jason jason', true)
client:set('jasonke'..msg.from.id, msg.text)    
client:set('jason'..msg.from.id, 'kaysend1')    
end      
-----------end---------
if jason == 'kaysend1' then 
 if matches[1] == 'http'then
 if msg.cd then return false end	
if matches[1] == "send" then return false end	
client:set('list1'..bot.id, matches[3])
client:set('list1u'..bot.id, matches[1]..matches[2])
 keyboard = {} 
 keyboard.inline_keyboard = {		
 {
 {text = "اضافه ",callback_data='/send'},					
 },	
 {
 {text = "نشر",callback_data='/isend'},					
 },	
 }
 api.sendKeyboard(msg.chat.id, ' اضافه المزيد من الازرار او النشر', keyboard)  
 client:set('jason'..msg.from.id, 'kaysend2')    
 end 
 end
if jason == 'kaysend2' then 
if matches[1] == 'http'then
if msg.cd then return false end	
if matches[1] == "send" then return false end	
client:set('list2'..bot.id, matches[3])
client:set('list2u'..bot.id, matches[1]..matches[2])
  keyboard = {} 
	keyboard.inline_keyboard = {		
    {
    {text = "اضافه ",callback_data='/send'},					
    },	
    {
    {text = "نشر",callback_data='/isend'},					
    },	
	    }
api.sendKeyboard(msg.chat.id, ' اضافه المزيد من الازرار او النشر', keyboard)  
client:set('jason'..msg.from.id, 'kaysend3')    
end 
end
if jason == 'kaysend3' then 
if matches[1] == 'http'then
if msg.cd then return false end	
if matches[1] == "send" then return false end	
client:set('list3'..bot.id, matches[3]) -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
client:set('list3u'..bot.id, matches[1]..matches[2])
keyboard = {} 
keyboard.inline_keyboard = {		
        {
		{text = "اضافه ",callback_data='/send'},					
		},	
        {
		{text = "نشر",callback_data='/isend'},					
	    },	
	}
api.sendKeyboard(msg.chat.id, ' اضافه المزيد من الازرار او النشر', keyboard)  
client:set('jason'..msg.from.id, 'kaysend4')    
end 
end
if jason == 'kaysend4' then 
if matches[1] == 'http'then
if msg.cd then return false end	
if matches[1] == "send" then return false end	
client:set('list4'..bot.id, matches[3])
client:set('list4u'..bot.id, matches[1]..matches[2])
  keyboard = {} 
  keyboard.inline_keyboard = {		
        {
		{text = "اضافه ",callback_data='/send'},					
		},	
        {
		{text = "نشر",callback_data='/isend'},					
		},	
	   }  
api.sendKeyboard(msg.chat.id, ' اضافه المزيد من الازرار او النشر', keyboard) 
client:set('jason'..msg.from.id, 'kaysend5')    
end 
end
-----------end---------  
if jason == 'kaysend5' then
if matches[1] == 'http'then
if msg.cd then return false end	
if matches[1] == "send" then return false end	
client:set('list5'..bot.id, matches[3])
client:set('list5u'..bot.id, matches[1]..matches[2])
  keyboard = {} 
  keyboard.inline_keyboard = {		
      {
	  {text = "نشر",callback_data='/isend'},					
	  },	
	  }
api.sendKeyboard(msg.chat.id, 'النشر', keyboard)    
end 
end
if msg.cb then 
if matches[1] == "isend" then
client:set('jason'..msg.from.id, 'end')   
local list1 = client:get('list1'..bot.id)
local list1u = client:get('list1u'..bot.id)
local list2 = client:get('list2'..bot.id)
local list2u = client:get('list2u'..bot.id)
local list3 = client:get('list3'..bot.id)
local list3u = client:get('list3u'..bot.id)
local list4 = client:get('list4'..bot.id)
local list4u = client:get('list4u'..bot.id)
local list5 = client:get('list5'..bot.id)
local list5u = client:get('list5u'..bot.id)
api.editMessageText(msg.chat.id, msg.message_id, 'نتضر رجا حتا يتم نشر المنشور في القنوات')
 local jasonke = client:get('jasonke'..msg.from.id)
 local users = client:smembers('jason'..bot.id)
 local keyboard = ''
if list1 ~= "x" then 
 keyboard = {}
 keyboard.inline_keyboard = {		
{{text = list1, url= list1u},},
{{text = "BOT LUA®", url="https://t.me/dev_aleppo"},},		
}       
 end
if list2 ~= "x" then 
 keyboard = {}
 keyboard.inline_keyboard = {		
{{text = list1, url= list1u},},
{{text = list2, url= list2u},},
{{text = "BOT LUA®", url="https://t.me/dev_aleppo"},},		
}       
 end
if list3 ~= "x" then 
 keyboard = {}
 keyboard.inline_keyboard = {		
{{text = list1, url= list1u},},
{{text = list2, url= list2u},},	
{{text = list3, url= list3u},},
{{text = "BOT LUA®", url="https://t.me/dev_aleppo"},},		
 }       
 end
if list4 ~= "x" then 
 keyboard = {}
 keyboard.inline_keyboard = {		
{{text = list1, url= list1u},},
{{text = list2, url= list2u},},	
{{text = list3, url= list3u},},	
{{text = list4, url= list4u},},	  
{{text = "BOT LUA®", url="https://t.me/dev_aleppo"},},		
}       
 end
if list5 ~= "x" then 
 keyboard = {}
 keyboard.inline_keyboard = {		
{{text = list1, url= list1u},},
{{text = list2, url= list2u},},	
{{text = list3, url= list3u},},	
{{text = list4, url= list4u},},	
{{text = list5, url= list5u},},	   
{{text = "BOT LUA®", url="https://t.me/dev_aleppo"},},		
}            
end
for i=1, #users do
   local jasonch = client:get('jasonch'..bot.id..''..users[i])
   if jasonch == 'yes' then
   local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/sendMessage?chat_id='..users[i] 
   url = url..'&text='..URL.escape(jasonke)
   url = url .. '&disable_web_page_preview=true'
   url = url..'&reply_markup='..JSON.encode(keyboard)
   local res = HTTPS.request(url)
   print(res) -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
   local jres = JSON.decode(res)	
   if not jres.result then    api.sendReply(msg, 'قامه بالمخالفة  '..users[1])  end 
   if jres.result then 
   local id = jres.result.message_id
   client:sadd('idjason'..bot.id..''..msg.message_id, '/deleteMessage?chat_id='..users[i]..'&message_id='..id) 
   client:set('jason'..msg.from.id, 'end')  
end
end
end
client:set('list1'..bot.id, "x")
client:set('list2'..bot.id, "x")
client:set('list3'..bot.id, "x")
client:set('list4'..bot.id, "x")
client:set('list5'..bot.id, "x")
	keyboard = {} 
	keyboard.inline_keyboard = {		
 		{
		{text = 'حذف من جميع القنوات',callback_data='/dele'..msg.message_id..''},					
		},	       
		{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
		},		
    }
api.sendKeyboard(msg.chat.id, 'تم نشر المنشور بنجاح يمكنك الضغط وسينم حذف النص', keyboard)   
client:set('jason'..msg.chat.id, 'end')    
end
end
-----------end---------  
if msg.cb then 
if matches[1] == "textsend" then
 	keyboard = {} 
	keyboard.inline_keyboard = {		
        {
		{text = "رجوع",callback_data='/send'},					
		},	
		{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
		},		
	}
api.editMessageText(msg.chat.id, msg.message_id, 'ارسال الان النص ليتم نشرها في القنوات', keyboard)
client:set('jason'..msg.from.id, 'textsend')    
end  
end
-----------end-----------
if jason == 'textsend' then 
if msg.cd then return false end	
if matches[1] == "send" then return false end	 
client:set('jason'..msg.from.id, 'end')    
 	api.sendReply(msg, 'نتضر رجا حتا يتم نشر المنشور في القنوات', true)
    local users = client:smembers('jason'..bot.id)
	for i=1, #users do
    local jasonch = client:get('jasonch'..bot.id..''..users[i])
    if jasonch == 'yes' then -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
    local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/sendMessage?chat_id='..users[i]..'&text='..URL.escape(msg.text)
    local res = HTTPS.request(url)
    local jres = JSON.decode(res)	
 if not jres.result then    api.sendReply(msg, 'قامه بالمخالفة '..users[1])  end 
 if jres.result then 
 local id = jres.result.message_id
 client:sadd('idjason'..bot.id..''..msg.message_id, '/deleteMessage?chat_id='..users[i]..'&message_id='..id) 
 client:set('jason'..msg.from.id, 'end')    
end
end
end
	keyboard = {} 
    keyboard.inline_keyboard = {		
 		{
		{text = 'حذف من جميع القنوات',callback_data='/dele'..msg.message_id..''},					
		},	       
		{
		{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
		},		
    	}
api.sendKeyboard(msg.chat.id, 'تم نشر النص بنجاح يمكنك الضغط وسينم حذف النص', keyboard)   
client:set('jason'..msg.chat.id, 'end')    
end   
-----------end---------    
if msg.cb then 
if matches[1] == "marksend" then
 	keyboard = {} 
	keyboard.inline_keyboard = {		
  {
	{text = "رجوع",callback_data='/send'},					
	},	
	{
	{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
	},		-- BY : t.me/dev_jason | CH : t.me/dev_aleppo
	}
api.editMessageText(msg.chat.id, msg.message_id, 'لرسال رابط \n [inline URL](http://www.example.com/) \n\nمثال اخر : \n [jason](https://t.me/dev_jason)', keyboard)
client:set('jason'..msg.from.id,'marksend')    
  end  
  end
-----------end---------
 if jason == 'marksend' then 
 if msg.cd then return false end		
 if matches[1] == "send" then return false end	
 client:set('jason'..msg.from.id, 'end')    
    api.sendReply(msg, 'نتضر رجا حتا يتم نشر المنشور في القنوات', true)
    local users = client:smembers('jason'..bot.id)
	  for i=1, #users do
    local jasonch = client:get('jasonch'..bot.id..''..users[i])
   local url2 = 'https://api.telegram.org/bot'..config.bot_api_key..'/getChatMember?chat_id='..users[i]..'&user_id='..bot.id..''
    local res2 = HTTPS.request(url2)
    local jres2 = JSON.decode(res2)	
    if jres2.result.status == 'administrator'  then 
    if jasonch == 'yes' then    
    local url = 'https://api.telegram.org/bot'..config.bot_api_key..'/sendMessage?chat_id='..users[i]..'&text='..URL.escape(msg.text)..'&parse_mode=Markdown&disable_web_page_preview=true'
    local res = HTTPS.request(url)
    local jres = JSON.decode(res)	
    if not jres.result then    api.sendReply(msg, 'قامه بالمخالفة '..users[1])  end 
	  if jres.result then 
    local id = jres.result.message_id
    client:sadd('idjason'..bot.id..''..msg.message_id, '/deleteMessage?chat_id='..users[i]..'&message_id='..id) 
    client:set('jason'..msg.from.id, 'end')    
    end
    end
    end
    end
	keyboard = {} 
	keyboard.inline_keyboard = {		
 	{
	{text = 'حذف من جميع القنوات',callback_data='/dele'..msg.message_id..''},					
	},	       
	{
	{text = "BOT LUA®", url="https://t.me/dev_aleppo"},					
	},		
    }
  api.sendKeyboard(msg.chat.id, 'تم نشر بنجاح يمكنك الضغط وسينم حذف', keyboard)   
  client:set('jason'..msg.chat.id, 'end')    
end    
end -- BY : t.me/dev_jason | CH : t.me/dev_aleppo

-------end-------
local triggers = {
  '^/(start)',
  '^###cb:/(photocode)',
  '^###cb:/(setch)',
  '^###cb:/(dele)(.*)',
  '^###cb:/(send)',
  '^###cb:/(textsend)',
  '^###cb:/(fwdsend)',
  '^###cb:/(marksend)',
  '^###cb:/(chhanl)',
  '^###cb:/(addch)',
  '^###cb:/(unaddch)',
  '^###cb:/(se)',
  '^###cb:/(home)',
  '^###cb:/(yess)(.*)',
  '^###cb:/(noo)(.*)',
  '^###cb:/(edstart)',
  '^###cb:/(addr)',
  '^###cb:/(kaysend)',
  '^###cb:/(photo)',
  '^###cb:/(jason)',
  '^###cb:/(kek)',
  '^###image',
  '^###cb:/(isend)',
  '^(http)(.*) (.*)',
  '^###cb:/(getcod)',
  '^###cb:/(reend)',
  '^###cb:/(addcode)',
  '^###cb:/(markcode)',
  '^###cb:/(listcode)',
  '^###cb:/(sundalllist)',
  '^/(send) (.*)_(.*)',
  '^(.*)'
} -- BY : t.me/dev_jason | CH : t.me/dev_aleppo
return {
  action = action,
  triggers = triggers,
}
-- BY : t.me/dev_jason | CH : t.me/dev_aleppo
