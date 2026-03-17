# Komentáře k openclaw-config-example.json

Soubor `openclaw-config-example.json` je šablona pro konfiguraci OpenClaw.
Zkopíruj ho jako `~/.openclaw/config.json` a uprav podle sebe.

> ⚠️ JSON nepodporuje komentáře — proto jsou vysvětlivky tady.

---

## Sekce `gateway`

```json
"gateway": {
  "port": 18789,
  "bind": "127.0.0.1",
  "token": "NAHRAD_TIMTO_SVYM_TOKENEM"
}
```

| Klíč | Význam |
|------|--------|
| `port` | Port, na kterém běží webchat. `18789` je výchozí. Otevři `http://localhost:18789`. |
| `bind` | Na jaké adrese gateway naslouchá. `127.0.0.1` = jen lokálně (doporučeno). Tailscale zajistí vzdálený přístup bez změny tohoto nastavení. |
| `token` | Bezpečnostní token pro API přístup. Vygeneruj si ho: `openssl rand -hex 32`. |

---

## Sekce `models`

```json
"models": {
  "default": "gemini-pro"
}
```

Výchozí model pro agenta. Možnosti:
- `"gemini-pro"` — Google Gemini (zdarma, doporučujeme)
- `"qwen-portal/coder-model"` — Qwen (zdarma, 1000 req/den)

Nastavuje se automaticky při prvním spuštění `openclaw`.

---

## Sekce `channels.discord`

```json
"channels": {
  "discord": {
    "enabled": false,
    "token": "TVUJ_DISCORD_BOT_TOKEN_SEM"
  }
}
```

| Klíč | Význam |
|------|--------|
| `enabled` | `false` = Discord bot je vypnutý (výchozí). Zapni na `true` až máš token. |
| `token` | Token Discord bota z Developer Portal. Viz [DISCORD-BOT-SETUP.md](../DISCORD-BOT-SETUP.md). |

---

## Sekce `workspace`

```json
"workspace": {
  "path": "~/openclaw/my-first-agent"
}
```

Cesta k workspace (složce s SOUL.md, USER.md atd.). Uprav na svou cestu.

---

## Jak config použít

1. Zkopíruj šablonu:
   ```bash
   mkdir -p ~/.openclaw
   cp examples/openclaw-config-example.json ~/.openclaw/config.json
   ```

2. Uprav podle sebe:
   ```bash
   nano ~/.openclaw/config.json
   ```

3. Spusť gateway:
   ```bash
   openclaw gateway start
   ```

---

## Poznámka k Tailscale

OpenClaw poslouchá na `127.0.0.1` (lokálně) — to je bezpečné.
Tailscale zajistí vzdálený přístup bez nutnosti otevírat port na internetu:

- Na stejném stroji: `http://localhost:18789`
- Z jiného zařízení ve Tailscale síti: `http://100.x.x.x:18789`

**Nikdy nenastavuj `bind` na `0.0.0.0` bez firewallu!**

---

*Součást My First Agent Workshopu — KOWEX Co. Holding*
