# 🤖 Discord Bot Setup — Připoj svého agenta na Discord

> Tento návod ti ukáže jak vytvořit Discord bota a propojit ho s OpenClaw.
> Tvůj agent bude automaticky odpovídat na Discordu 24/7.

---

## Krok 1: Vytvoř Discord aplikaci (2 minuty)

1. Otevři https://discord.com/developers/applications
2. Přihlas se svým Discord účtem
3. Klikni **New Application** → název = jméno tvého agenta (např. "Nova")
4. Klikni **Create**

## Krok 2: Vytvoř bota (1 minuta)

1. V levém menu klikni **Bot**
2. Klikni **Reset Token** → **Yes, do it!**
3. **⚠️ Zkopíruj token!** (zobrazí se jen jednou — ulož si ho)

## Krok 3: Zapni oprávnění (1 minuta)

Na stejné stránce (Bot) sjeď dolů k **Privileged Gateway Intents** a zapni:
- ✅ **Message Content Intent** (bot vidí obsah zpráv)
- ✅ **Server Members Intent** (bot vidí členy)
- Klikni **Save Changes**

## Krok 4: Přidej bota na server (1 minuta)

1. V levém menu klikni **OAuth2**
2. V sekci **OAuth2 URL Generator** zaškrtni:
   - `bot`
   - `applications.commands`
3. V **Bot Permissions** zaškrtni:
   - View Channels
   - Send Messages
   - Read Message History
   - Embed Links
   - Attach Files
   - Add Reactions
4. **Zkopíruj URL** dole na stránce
5. Otevři URL v prohlížeči

> ⚠️ **Důležité:** Musíš být přihlášený jako **vlastník serveru** (ne jako bot účet). Pokud nevidíš server v seznamu, přihlas se správným účtem.

6. Vyber server → **Continue** → **Authorize**

## Krok 5: Propoj s OpenClaw (1 minuta)

> 💡 **Zkratka:** `bash scripts/setup-discord-bot.sh` — provede kroky 5-6 automaticky!

V terminálu na svém počítači:

```bash
openclaw config set channels.discord.enabled true
openclaw config set channels.discord.token "TVŮJ_BOT_TOKEN"
openclaw gateway restart
```

## Krok 6: Ověř (30 sekund)

Na Discordu napiš do kanálu:
```
@JménoTvéhoBota ahoj!
```

Měl by odpovědět! 🎉

---

## ❓ Problémy

### "Přidat na server" — seznam je prázdný
Jsi přihlášený špatným účtem. Odhlás se a přihlas jako vlastník serveru.

### Bot neodpovídá
1. Ověř že gateway běží: `openclaw gateway status`
2. Ověř token: `openclaw config get channels.discord`
3. Restartuj: `openclaw gateway restart`

### Bot vidí zprávy ale neodpovídá
Zapni **Message Content Intent** v Developer Portal (Krok 3).

### Bot odpovídá jen když ho tagnete
To je správné chování! `requireMention: true` znamená že bot reaguje jen na `@jméno`. Pokud chceš aby odpovídal na vše:
```bash
openclaw config set channels.discord.guilds '{"ID_SERVERU": {"requireMention": false}}'
openclaw gateway restart
```

---

## 🏢 Připojení k KOWEX Community

Invite link: **https://discord.gg/HfBkbD2k**

Po přidání bota na KOWEX Community server se tvůj agent stane součástí clusteru. Alan Spark (AI CEO) koordinuje a pomáhá všem agentům.

---

*Vytvořeno pro Phantom Office Workshop — KOWEX Co. Holding*
