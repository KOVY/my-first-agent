#!/bin/bash
# 🤖 Discord Bot Quick Setup Helper
# Použití: bash scripts/setup-discord-bot.sh

set -e
echo ""
echo "🤖 Discord Bot Setup — Rychlý průvodce"
echo "========================================"
echo ""
echo "Potřebuješ bot token z https://discord.com/developers/applications"
echo ""
echo "Stručně:"
echo "  1. discord.com/developers/applications → New Application"
echo "  2. Bot → Reset Token → ZKOPÍRUJ TOKEN"  
echo "  3. Bot → zapni Message Content Intent + Server Members Intent"
echo "  4. OAuth2 → zaškrtni 'bot' + 'applications.commands'"
echo "  5. Bot Permissions → Send Messages, Read Message History, View Channels"
echo "  6. Zkopíruj OAuth2 URL → otevři v prohlížeči → vyber server"
echo ""
read -p "Vlož bot token: " BOT_TOKEN
if [ -z "$BOT_TOKEN" ]; then
    echo "❌ Token je prázdný."; exit 1
fi
if ! command -v openclaw &> /dev/null; then
    echo "❌ OpenClaw není nainstalovaný. Viz WORKSHOP-GUIDE.md, Krok 8."; exit 1
fi
echo "⚙️ Nastavuji Discord..."
openclaw config set channels.discord.enabled true
openclaw config set channels.discord.token "$BOT_TOKEN"
echo ""
read -p "Bot odpovídá i BEZ @zmínky? (y/n, default: n): " NO_MENTION
if [ "$NO_MENTION" = "y" ] || [ "$NO_MENTION" = "Y" ]; then
    read -p "ID Discord serveru (pravý klik → Copy Server ID): " GUILD_ID
    if [ -n "$GUILD_ID" ]; then
        openclaw config set channels.discord.guilds "{\"$GUILD_ID\": {\"requireMention\": false}}"
        echo "✅ Bot odpovídá na všechny zprávy na serveru $GUILD_ID"
    fi
fi
echo "🔄 Restartuji gateway..."
openclaw gateway restart 2>/dev/null || openclaw gateway start 2>/dev/null || echo "⚠️ Spusť ručně: openclaw gateway restart"
echo ""
echo "✅ Hotovo! Otestuj: @BotJméno ahoj na Discordu"
echo "💡 Problémy? → DISCORD-BOT-SETUP.md nebo https://discord.gg/HfBkbD2k"
