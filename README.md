<h1 align="center">
 <img src="https://i.imgur.com/Dms5orM.jpeg" />
<br>
</h1>

## Description

Whenever a player joins or leaves, a message will be displayed indicating their arrival or departure.

## Installation

- Drag the ***csgo*** folder into the server directory.
- Go to the ***csgo/cfg*** folder.
- Insert ***script_reload_code connect-message*** into the listenserver.cfg and server.cfg files.

## Details

- If it's a bot, it will be indicated in the message.
- Bright colors when connecting and disconnecting.
- Display the name of the user who disconnects.

## New features

- Add Languages

  Now you can add custom languages; you just need to translate the lines. It's very important to follow the order.

  Ubication file ***connect-message/cfg/cmlanguages.lua***

  Ex: ["hi"] = {"बॉट", "उपयोगकर्ता", "कट गया", "जुड़ गया"}

  Ubication file ***connect-message/cfg/cmconfig.lua***
  
  EX: language = "hi",

- Enable and disable bot notifications
  
  Now you have the option to choose whether you want to show bot notifications or not. To do so, simply access the file ***connect-message/cfg/cmconfig.lua*** and change 'true' to enable them or 'false' to disable them.
 
- Change nametag

  Now you can customize the label name by simply accessing the file ***connect-message/cfg/cmconfig.lua***  and changing the value of 'nameTag' to your desired one.
## Images

<h1 align="center">
 <img src="https://i.imgur.com/7IYsl1g.png" />
 <img src="https://i.imgur.com/nAPmx6r.png" />
<br>
</h1>


## Authors

- Creator: [@subzzone](https://github.com/subzzone)

## Objectives

- Insert GeoIP in the message 
- Personalize configuration: ✅
  - Insert or remove bot messages ✅
  - Change message colors ❌ (Unnecessary in this situation)
  - Change name tag ✅
- Insert more languages ✅

## Links

- Alliedmodders: https://forums.alliedmods.net/member.php?u=310879
- Steam: https://steamcommunity.com/id/alexelmanco/
- Twitter: https://twitter.com/55Guenfoudi






