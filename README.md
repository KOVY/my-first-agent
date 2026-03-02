# 🤖 My First Agent

**Za 15 minut máš vlastního AI agenta. Zdarma.**

Vlastní jméno, paměť, osobnost. Webchat v prohlížeči. Volitelně Discord bot 24/7.
Žádné programování, žádná kreditka.

---

## 🚀 Rychlý start

### Krok 1: Nainstaluj prerequisites

Potřebuješ **Node.js 22+** a **Git**. Viz [WORKSHOP-GUIDE.md](WORKSHOP-GUIDE.md) pro přesné příkazy na tvůj systém (Linux/Mac/Windows).

### Krok 2: Nastav PATH a nainstaluj OpenClaw

```bash
# PATH (Linux/Mac)
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH="$HOME/.npm-global/bin:$PATH"
echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.bashrc

# Instalace OpenClaw
cd /tmp && npm pack openclaw@latest
npm install -g ./openclaw-*.tgz
```

### Krok 3: Nastav Qwen model (zdarma)

```bash
openclaw plugins enable qwen-portal-auth
openclaw models auth login --provider qwen-portal --set-default
openclaw models set qwen-portal/coder-model
```

Přihlas se přes prohlížeč — zdarma, 1000 požadavků/den.

### Krok 4: Stáhni a uprav

```bash
mkdir -p ~/openclaw && cd ~/openclaw
git clone https://github.com/KOVY/my-first-agent.git
cd my-first-agent

# Zkopíruj příklady a uprav
cp examples/SOUL-example.md SOUL.md
cp examples/USER-example.md USER.md
nano SOUL.md   # dej agentovi jméno a osobnost
nano USER.md   # napiš kdo jsi ty
```

### Krok 5: Spusť! 🎉

```bash
openclaw gateway --port 18789
```

Otevři prohlížeč → **http://localhost:18789** → Tvůj agent je tam!

---

## 📁 Co je v repozitáři

| Soubor | Co to je |
|--------|----------|
| `SOUL.md` | Osobnost tvého agenta — jméno, hodnoty, styl |
| `USER.md` | Informace o tobě — jak tě agent oslovuje |
| `IDENTITY.md` | Vizitka agenta |
| `AGENTS.md` | Pracovní pravidla a návyky |
| `TOOLS.md` | Tvoje lokální poznámky k nástrojům |
| `memory/` | Složka pro agentovu paměť (vytvoří se automaticky) |
| `skills/` | Dovednosti — rozšíření co agent umí |

---

## 🧠 Jak to funguje

Tvůj agent čte soubory v tomto repozitáři jako svou "paměť" a "identitu". Když ho spustíš:

1. Přečte `SOUL.md` → ví kdo je
2. Přečte `USER.md` → ví kdo jsi ty
3. Přečte `AGENTS.md` → ví jak pracovat
4. Ukládá si poznámky do `memory/` → pamatuje si mezi sessions

**Žádná magie, žádný cloud.** Všechno je v těchto souborech na tvém počítači.

---

## 💬 Discord — připoj se a připoj svého agenta

### Komunita
Připoj se k nám — sdílej co tvůj agent umí, získej tipy, potkej další lidi s agenty:

👉 **[Discord — KOWEX Community](https://discord.gg/HfBkbD2k)**

### Discord bot (tvůj agent na Discordu 24/7)
Podrobný návod: **[DISCORD-BOT-SETUP.md](DISCORD-BOT-SETUP.md)**

Nebo rychle:
```bash
bash scripts/setup-discord-bot.sh
```

---

## 📜 Licence

MIT — používej, upravuj, sdílej.

---

*Vytvořeno s ❤️ firmou [KOWEX Co. Holding](https://kowexconsulting.cz) — 13 firem, 13 AI agentů, 0 zaměstnanců.*
