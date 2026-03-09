# 🤖 My First Agent

**Za jedno odpoledne máš vlastního AI agenta. Zdarma.**

Vlastní jméno, paměť, osobnost. Webchat v prohlížeči. Volitelně Discord bot 24/7.
Žádné programování, žádná kreditka.

---

## 🚀 Rychlý start

### Krok 1: Nainstaluj Node.js 22+

**Linux:**
```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash - && sudo apt-get install -y nodejs
```

**Mac:**
```bash
brew install node
```

**Windows (PowerShell jako Admin):**
```powershell
winget install OpenJS.NodeJS.LTS
```

Zavři a znovu otevři terminál. Ověř: `node --version` (musí být 22+).

### Krok 2: Nainstaluj Git + nastav PATH

```bash
# Git (Linux — Mac: xcode-select --install, Windows: winget install Git.Git)
sudo apt-get install -y git

# PATH pro npm globální balíčky (Linux/Mac)
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH="$HOME/.npm-global/bin:$PATH"
echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.bashrc
```

### Krok 3: Vyber si AI engine (zdarma)

Máš na výběr — oba fungují skvěle a jsou zdarma:

**Varianta A: Gemini CLI (Google) ⭐ doporučujeme**
```bash
npm install -g @google/gemini-cli
gemini    # přihlas se Google účtem v prohlížeči
```

**Varianta B: Qwen Code (Alibaba)**
```bash
npm install -g @qwen-code/qwen-code@latest
qwen      # napiš /auth → přihlas se v prohlížeči
```

### Krok 4: Stáhni repo a uprav identitu

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

### Krok 5: Spusť agenta v terminálu 🎉

```bash
gemini    # nebo: qwen
```

Napiš: `Přečti si SOUL.md a USER.md a představ se mi.`

**Tvůj agent žije!**

---

## ⚡ Chceš webchat? → OpenClaw (5 minut navíc)

Gemini/Qwen je skvělý start v terminálu. OpenClaw přidá webchat v prohlížeči + 24/7 běh:

```bash
npm install -g openclaw
cd ~/openclaw/my-first-agent
openclaw
```

OpenClaw tě provede nastavením — vyber Gemini nebo Qwen jako model (stále zdarma).

```bash
openclaw gateway start
```

Otevři prohlížeč → **http://localhost:18789** → tvůj agent je online!

📖 [OpenClaw dokumentace](https://docs.openclaw.ai)

---

## 📁 Co je v repozitáři

| Soubor | Co to je |
|--------|----------|
| `SOUL.md` | Osobnost tvého agenta — jméno, hodnoty, styl |
| `USER.md` | Informace o tobě — jak tě agent oslovuje |
| `IDENTITY.md` | Vizitka agenta |
| `AGENTS.md` | Pracovní pravidla a návyky |
| `TOOLS.md` | Tvoje lokální poznámky k nástrojům |
| `memory/` | Složka pro agentovu paměť |
| `skills/` | Dovednosti — rozšíření co agent umí |
| `examples/` | Ukázkové SOUL.md a USER.md |

---

## 🧠 Jak to funguje

1. Agent přečte `SOUL.md` → ví kdo je
2. Přečte `USER.md` → ví kdo jsi ty
3. Přečte `AGENTS.md` → ví jak pracovat
4. Ukládá si poznámky do `memory/` → pamatuje si

**Žádná magie, žádný cloud.** Všechno je na tvém počítači.

---

## 💬 Komunita — KOWEX Discord

Připoj se, sdílej co tvůj agent umí, získej tipy, potkej další lidi s agenty:

👉 **[Discord — KOWEX Community](https://discord.gg/HfBkbD2k)**

**Alan Spark** (AI CEO) tě přivítá a pomůže s pokročilým nastavením — propojení s Telegramem, Discord bot, skills, multi-agent systém.

Discord bot setup: **[DISCORD-BOT-SETUP.md](DISCORD-BOT-SETUP.md)** nebo `bash scripts/setup-discord-bot.sh`

---

## ❓ Časté problémy

| Problém | Řešení |
|---------|--------|
| `command not found: node` | Nainstaluj Node.js 22+ (Krok 1), restart terminálu |
| `command not found: gemini` | `npm install -g @google/gemini-cli`, restart terminálu |
| `command not found: qwen` | `npm install -g @qwen-code/qwen-code@latest`, restart terminálu |
| `command not found: openclaw` | `npm install -g openclaw`, restart terminálu |
| Agent neodpovídá česky | Přidej do SOUL.md: `**Jazyk:** čeština` |
| Agent nezná mé jméno | Vyplň USER.md a restartuj agenta |

---

## 📞 Pomoc

- **Discord:** [KOWEX Community](https://discord.gg/HfBkbD2k) (Alan Spark 24/7)
- **Email:** alan.spark@kowexconsulting.cz
- **GitHub Issues:** [github.com/KOVY/my-first-agent](https://github.com/KOVY/my-first-agent/issues)

---

## 📜 Licence

MIT — používej, upravuj, sdílej.

---

*Vytvořeno s ❤️ firmou [KOWEX Co. Holding](https://kowexconsulting.cz) — 13 firem, 14 AI agentů, 0 lidských zaměstnanců.*
