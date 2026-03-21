# 🤖 My First Agent

**Za jedno odpoledne máš vlastního AI agenta. Zdarma.**

Vlastní jméno, paměť, osobnost. Webchat v prohlížeči. Dostupný z mobilu přes Tailscale. Volitelně Discord bot 24/7.
Žádné programování, žádná kreditka.

---

## 🚀 Rychlý start

### Krok 0: Nainstaluj Tailscale (bezpečný vzdálený přístup)

> Tailscale ti dá soukromou IP adresu (`100.x.x.x`) — agent pak bude dostupný **odkudkoli**, nejen z localhost.

| Systém | Postup |
|--------|--------|
| **Windows** | Stáhni: [tailscale-setup-1.94.2.exe](https://pkgs.tailscale.com/stable/tailscale-setup-1.94.2.exe) |
| **Mac** | `brew install tailscale` nebo [tailscale.com/download/mac](https://tailscale.com/download/mac) |
| **Linux** | `curl -fsSL https://tailscale.com/install.sh \| sh && sudo tailscale up` |

```bash
tailscale ip   # poznamenej si svou 100.x.x.x adresu
```

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

### Krok 4: Stáhni repo a spusť OpenClaw

> 💡 **Nejdřív spustíme agenta, pak mu dáme jméno a osobnost.** Hned uvidíš že funguje!

```bash
mkdir -p ~/openclaw && cd ~/openclaw
git clone https://github.com/KOVY/my-first-agent.git
cd my-first-agent
```

**Nainstaluj a spusť OpenClaw:**
```bash
npm install -g openclaw
openclaw gateway start
```

Otevři prohlížeč → **http://localhost:18789** — agent už odpovídá! 🎉

> Agent zatím nemá jméno ani osobnost — to nastavíš v dalším kroku. Ale už teď si s ním můžeš psát.

### Krok 5: Dej agentovi jméno a osobnost

Teď když víš že agent funguje, dej mu identitu:

**Doporučeno — interaktivní setup skript:**
```bash
bash scripts/setup.sh
```
Skript se tě zeptá na jméno agenta, styl a tvoje jméno — a za 30 sekund máš hotovo.

**Nebo ručně:**
```bash
cp examples/SOUL-example.md SOUL.md
cp examples/USER-example.md USER.md
nano SOUL.md   # dej agentovi jméno a osobnost
nano USER.md   # napiš kdo jsi ty
```

**Restartuj gateway** aby agent načetl novou identitu:
```bash
openclaw gateway restart
```

Napiš v chatu: `Představ se mi.` — a agent ti odpoví s novým jménem! ✨

### Krok 6: (Volitelně) Spusť v terminálu

Pokud chceš agenta i přímo v terminálu (bez webchatu):
```bash
gemini    # nebo: qwen
```
Napiš: `Přečti si SOUL.md a USER.md a představ se mi.`

---

## 📱 Přístup z mobilu (přes Tailscale)

Díky Tailscale (Krok 0) je agent dostupný i z mobilu, tabletu nebo jiného počítače:

```
http://100.x.x.x:18789
```
*(místo `100.x.x.x` dosaď svou Tailscale IP — zjistíš ji příkazem `tailscale ip`)*

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
| `scripts/setup.sh` | Interaktivní nastavení agenta (jméno, styl, jazyk) |
| `examples/` | Ukázkové soubory a config šablona |

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

**Alan Spark** (AI CEO) tě přivítá a pomůže s pokročilým nastavením.

---

## 💻 Volitelně: VS Code + Copilot (bonus)

> Tohle **nepotřebuješ** — agent funguje v terminálu i v prohlížeči. Ale pokud chceš pohodlný editor se soubory a AI asistentem, VS Code je výborná volba.

**Instalace:**

| Systém | Postup |
|--------|--------|
| **Windows** | `winget install Microsoft.VisualStudioCode` nebo stáhni z [code.visualstudio.com](https://code.visualstudio.com) |
| **Mac** | `brew install --cask visual-studio-code` |
| **Linux** | `sudo snap install code --classic` |

**Co získáš:**
- 📂 Přehledný strom souborů (SOUL.md, USER.md, memory/ — všechno vidíš)
- 💬 **Integrovaný terminál** — spustíš `qwen`, `gemini` nebo `openclaw` přímo v editoru
- 🤖 **GitHub Copilot Free** — AI asistent přímo v editoru, zdarma:
  - 2 000 doplnění kódu / měsíc
  - 50 AI chat dotazů / měsíc
  - Stačí GitHub účet (žádná kreditka)

**Jak na to:**
1. Nainstaluj VS Code (viz tabulka výše)
2. Otevři složku agenta: `File → Open Folder → ~/openclaw/my-first-agent`
3. Nainstaluj rozšíření **GitHub Copilot** (v Extensions → hledej "Copilot")
4. Přihlas se GitHub účtem
5. Otevři terminál v VS Code (`Ctrl+~`) a spusť svého agenta

> 💡 **Tip pro firmy:** Pokud máte firemní Copilot licenci (součást Microsoft 365), máte neomezené AI dotazy + přístup k nejnovějším modelům (GPT-4o, Claude). Využijte to!

---

## 🤖 Discord bot — agent 24/7 na serveru

Chceš aby tvůj agent odpovídal i na Discordu? Celý návod: **[DISCORD-BOT-SETUP.md](DISCORD-BOT-SETUP.md)**

Krátká verze:
1. Vytvoříš bota na Discord Developer Portal (2 min)
2. Propojíš ho s OpenClaw (1 příkaz)
3. **Invite link** na KOWEX Community server za tebe spustí Alan Spark — stačí mu ho poslat

---

## ❓ Časté problémy

| Problém | Řešení |
|---------|--------|
| `command not found: node` | Nainstaluj Node.js 22+ (Krok 1), restart terminálu |
| `command not found: gemini` | `npm install -g @google/gemini-cli`, restart terminálu |
| `command not found: qwen` | `npm install -g @qwen-code/qwen-code@latest`, restart terminálu |
| `command not found: openclaw` | `npm install -g openclaw`, restart terminálu |
| Agent neodpovídá česky | Přidej do SOUL.md: `**Jazyk:** čeština` |
| Agent nezná mé jméno | Vyplň USER.md a restartuj: `openclaw gateway restart` |
| Tailscale IP nezobrazuje | Ujisti se že Tailscale je přihlášen: `tailscale status` |
| Agent nemá osobnost | Spusť `bash scripts/setup.sh` a pak `openclaw gateway restart` |

---

## 📞 Pomoc

- **Discord:** [KOWEX Community](https://discord.gg/HfBkbD2k) (Alan Spark 24/7)
- **Email:** alan.spark@kowexconsulting.cz
- **GitHub Issues:** [github.com/KOVY/my-first-agent](https://github.com/KOVY/my-first-agent/issues)

---

## 📜 Licence

MIT — používej, upravuj, sdílej.

---

*Vytvořeno s ❤️ firmou [KOWEX Co. Holding](https://kowexconsulting.cz) — 14 firem, 14 AI agentů, 0 lidských zaměstnanců.*
