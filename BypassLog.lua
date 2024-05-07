webhookSend = function() 
  monarchSatan = {}
  monarchSatan.username = "Bot Log"
  monarchSatan.useEmbeds = true
  monarchSatan.embeds = {
  {
    author = {
      name = "",
      url = "",
      icon_url = "" 
    }, 
  title = "`iLegal User Log`",
  url = "",
  description = "### `?`", 
        color = 000000,
        fields = {
        {
          name = "<a:discord:1086565330404515860> DiscordUID :", 
          value = "`"..getDiscordID().."`", 
          inline = true
        }, 
      {
        name = "<a:coding:1099535058534150234> Running Script :",
        value = "`"..scriptName.. "`", 
        inline = true
      }
    }, 
      thumbnail = {
            url = "https://cdn.discordapp.com/attachments/1196017684807159868/1237307975442497596/95b8a4d948f6a023da7fb2cb8abe92c4.jpg?ex=663b2c59&is=6639dad9&hm=1241f42d83ddf8086bbb1e253f6da6c13c915e91cfe6eb3dec9411db43d614a8&"
        },
        image = {
            url = ""
        },
        footer = {
            text = "",
            icon_url = ""
        }
  }
}
sendWebhook("https://discord.com/api/webhooks/1236968683302162462/_6asrM_k2SJyLqAOxpJWvHrjGOGrjBieumPwlx_lwcNn6LbOuk3MXfjh8DlCAKa10aFK", monarchSatan)
end
webhookSend() 
