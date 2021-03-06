--[[

grampo.lua

http://telegram.me/grampobot

Dependencies:

    $ sudo apt-get install lua lua-sec lua-filesystem inotify-hookable
    $ git submodule init
    $ git submodule update
    $ wget http://regex.info/code/JSON.lua
    $ lua grampo.lua

]]

local lfs = require("lfs")

function join(table1, table2)
   result = table1
   for index, value in pairs(table2) do
      table.insert(result, value)
   end
   return result
end

function load_transcripts(dir)
  local transcripts = {}
  for filename in lfs.dir(dir) do
    if string.match(filename, ".lua$") and not string.match(filename, "melhores") then
      print("transcript file '" .. filename .. "' loaded")
      transcripts = join(transcripts, dofile(dir .. filename))
    end
  end
  return transcripts
end

-- load all transcripts from grampo-transcripts/*.lua files
local transcripts = load_transcripts('grampo-transcripts/')
local melhores_transcripts = dofile('grampo-transcripts/melhores.lua')

-- load keywords
keywords = dofile('grampo-keywords.lua')
melhores_keywords = {}
for index, row in pairs(melhores_transcripts) do
  for i, keyword in pairs(row.keywords) do
    melhores_keywords[keyword] = index
  end
end

-- read bot token from grampo.token file
local file = io.open("grampo.token", "r")
local token = file:read()

-- create and configure new bot with set token
local bot, extension = require("lua-bot-api").configure(token)

function message_to_me(msg)
  exit_words = {'saia', 'vaza', 'partiu', 'sair', 'licença', 'xô', 'fora'}
  for index, word in pairs(exit_words) do
    if string.match(msg.text, word) then
      bot.sendMessage(msg.chat.id, "tchau querida(o)")
      bot.leaveChat(msg.chat.id)
    end
  end
end

-- override onMessageReceive function so it does what we want
extension.onTextReceive = function (msg)
  print("New Message by " .. msg.from.first_name)
  if (string.match(msg.text, '^@' .. bot.username .. ' ')) then
    message_to_me(msg)
  else
    for word, index in pairs(melhores_keywords) do
      if string.match(string.lower(msg.text), word) then
        bot.sendMessage(msg.chat.id, melhores_transcripts[index][1] .. ': ' .. melhores_transcripts[index][2])
        return
      end
    end
    for index, word in pairs(keywords) do
      if string.match(string.lower(msg.text), word) then
        math.randomseed(os.time())
        random = math.random(table.maxn(transcripts))
        bot.sendMessage(msg.chat.id, transcripts[random][1] .. ': ' .. transcripts[random][2])
        return
      end
    end
  end
end

-- This runs the internal update and callback handler
-- you can even override run()
extension.run()
