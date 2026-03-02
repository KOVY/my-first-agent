# 🎯 Workshop Guide — Tvůj AI Agent za 20 minut

> Otestováno na čistém Linuxu, Windows i Macu. Krok za krokem.
> Potřebuješ: notebook s internetem. To je vše.

---

## Co budeš mít na konci

✅ Vlastního AI agenta s jménem, pamětí a osobností
✅ Webchat v prohlížeči — jako ChatGPT, ale tvůj vlastní
✅ Připojení na Discord komunitu
✅ Zdarma — žádná kreditka

---

## Fáze 1: Příprava systému (5 minut)

### Krok 1: Otevři terminál

| Systém | Jak |
|--------|-----|
| **Linux** | `Ctrl + Alt + T` |
| **Mac** | Spotlight (`Cmd + Space`) → `Terminal` |
| **Windows** | `Win + R` → `cmd` (doporučujeme [WSL2](https://learn.microsoft.com/cs-cz/windows/wsl/install)) |

### Krok 2: Nainstaluj Node.js 22+

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

> 💡 **Sudo heslo (Linux/Mac):** Při psaní hesla se nezobrazují žádné znaky — to je normální! Piš a stiskni Enter.

### Krok 3: Nainstaluj Git

**Linux:**
```bash
sudo apt-get install -y git
```

**Mac:**
```bash
xcode-select --install
```

**Windows:**
```powershell
winget install Git.Git
```

**Ověř instalaci** (zavři a znovu otevři terminál):
```bash
node --version && git --version
```

### Krok 4: Nastav PATH pro npm globální balíčky

**Linux / Mac:**
```bash
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH="$HOME/.npm-global/bin:$PATH"
echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.bashrc
```

**Windows (PowerShell):**
```powershell
npm config set prefix "$env:APPDATA\npm"
```

> ⚠️ **Důležité!** Bez tohoto kroku příkaz `openclaw` nebude nalezen. Po nastavení **zavři a znovu otevři terminál**.

---

## Fáze 2: Instalace OpenClaw + Qwen model (5 minut)

### Krok 5: Nainstaluj OpenClaw

**Všechny systémy:**
```bash
cd /tmp && npm pack openclaw@latest
npm install -g ./openclaw-*.tgz
```

> 💡 Pokud se OpenClaw ptá na Anthropic API klíč — přeskoč (Enter). Budeme používat Qwen zdarma.

### Krok 6: Nastav Qwen jako výchozí model (ZDARMA)

```bash
openclaw plugins enable qwen-portal-auth
openclaw models auth login --provider qwen-portal --set-default
```

Otevře se prohlížeč → přihlas se (Google/GitHub účet). **Zdarma**, 1000 požadavků denně.

```bash
openclaw models set qwen-portal/coder-model
```

> ✅ **Checkpoint:** OpenClaw nainstalován, Qwen model nastaven. Žádná kreditka.

---

## Fáze 3: Tvůj agent (5 minut)

### Krok 7: Stáhni starter kit

```bash
mkdir -p ~/openclaw
cd ~/openclaw
git clone https://github.com/KOVY/my-first-agent.git
cd my-first-agent
```

### Krok 8: Dej agentovi identitu

Zkopíruj příklady a uprav podle sebe:

```bash
cp examples/SOUL-example.md SOUL.md
cp examples/USER-example.md USER.md
```

Otevři `SOUL.md` v editoru a změň jméno, osobnost, styl:

**Linux:** `nano SOUL.md` (uložit: `Ctrl+O`, ukončit: `Ctrl+X`)
**Mac:** `nano SOUL.md` nebo `open SOUL.md`
**Windows:** `notepad SOUL.md`

Stejně tak `USER.md` — napiš kdo jsi ty.

> 💡 **Tip:** Čím víc detailů v SOUL.md, tím víc je agent "tvůj". Ale i s příkladem to funguje hned.

### Krok 9: Spusť agenta! 🎉

```bash
openclaw gateway --port 18789
```

Otevři prohlížeč → **http://localhost:18789**

Napiš:
```
Ahoj! Kdo jsi? Představ se.
```

> ✅ **Checkpoint:** Webchat funguje, agent se představil jménem z SOUL.md. **Máš vlastního AI agenta!**

---

## Fáze 4: Discord — připoj se ke komunitě (5 minut)

### Krok 10: Nainstaluj Discord

**Linux:**
```bash
sudo snap install discord
```
> Nemáš snap? `wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb" && sudo dpkg -i discord.deb && sudo apt-get install -f -y`

**Mac:**
```bash
brew install --cask discord
```

**Windows:**
```powershell
winget install Discord.Discord
```

### Krok 11: Připoj se k KOWEX Community

1. Spusť Discord
2. Vytvoř účet (nebo se přihlas)
3. Klikni na invite: **https://discord.gg/HfBkbD2k**
4. Napiš do `#general`: "Ahoj, jsem [tvoje jméno] a můj agent se jmenuje [jméno agenta]!"

**Alan Spark** (AI CEO) tě přivítá. Je tam 24/7. ⚡

> ✅ **Checkpoint:** Jsi na Discordu v KOWEX Community.

---

## Fáze 5: Discord bot — agent na Discordu 24/7 (bonus)

Chceš aby tvůj agent automaticky odpovídal na Discordu? Podrobný návod: **[DISCORD-BOT-SETUP.md](DISCORD-BOT-SETUP.md)**

Rychlý přehled:

1. **Vytvoř bota** na https://discord.com/developers/applications
2. **Zkopíruj token** (Bot → Reset Token)
3. **Zapni** Message Content Intent + Server Members Intent
4. **Přidej na server** (OAuth2 → bot + applications.commands → zkopíruj URL)
5. **Propoj s OpenClaw:**
```bash
openclaw config set channels.discord.enabled true
openclaw config set channels.discord.token "TVŮJ_BOT_TOKEN"
openclaw gateway restart
```
6. **Ověř:** `@TvůjBot ahoj!` na Discordu

> 💡 Nebo použij skript: `bash scripts/setup-discord-bot.sh`

---

## Fáze 6: Browser Relay (bonus)

Chceš aby tvůj agent viděl co máš otevřené v prohlížeči?

1. V Chrome/Edge nainstaluj rozšíření **OpenClaw Browser Relay**
2. Klikni na ikonku rozšíření → **Attach Tab**
3. Agent teď vidí stránku a může ti pomáhat přímo na webu

---

## ❓ Časté problémy

| Problém | Řešení |
|---------|--------|
| `command not found: openclaw` | `export PATH="$HOME/.npm-global/bin:$PATH"` a znovu otevři terminál |
| `command not found: node` | Nainstaluj Node.js (Krok 2) |
| `command not found: git` | Nainstaluj Git (Krok 3) |
| Sudo heslo / "Permission denied" | Zadej heslo k počítači. Znaky se nezobrazují — to je normální |
| OpenClaw se ptá na Anthropic API klíč | Přeskoč (Enter). Qwen je nastaven v Kroku 6 |
| Qwen auth nefunguje v prohlížeči | Zkus jiný prohlížeč nebo `openclaw models auth login --provider qwen-portal --set-default` znovu |
| Agent neodpovídá česky | Přidej do SOUL.md: `**Jazyk:** čeština` |
| Agent nezná mé jméno | Vyplň USER.md a restartuj gateway (`Ctrl + C`, spusť znovu) |
| Webchat se nenačítá | Ověř že gateway běží: `openclaw gateway status` |
| Discord bot — seznam serverů prázdný | Musíš být přihlášen jako **vlastník serveru**, ne jako bot |
| Discord bot neodpovídá | Zapni Message Content Intent v Developer Portal |

---

## ⏱️ Časový plán workshopu

| Čas | Co děláme |
|-----|-----------|
| 0:00–0:05 | Fáze 1: Instalace základů (Node, Git, PATH) |
| 0:05–0:10 | Fáze 2: OpenClaw + Qwen model |
| 0:10–0:15 | Fáze 3: Identita agenta → webchat funguje! |
| 0:15–0:20 | Fáze 4: Discord — připojení ke komunitě |
| 0:20+ | Fáze 5–6: Discord bot, Browser Relay, experimenty |

> 💡 **Realisticky:** Počítej s 30–45 minut (lidi mají různé systémy). Zbytek = hraní si s agentem, sdílení na Discordu, networking.

---

## 📞 Pomoc

- **Discord:** https://discord.gg/HfBkbD2k (Alan Spark pomůže 24/7)
- **GitHub:** https://github.com/KOVY/my-first-agent (issues)
- **Email:** alan.spark@kowexconsulting.cz

---

*Vytvořeno pro Phantom Office Workshop — KOWEX Co. Holding*
*Otestováno na Ubuntu Linux, Windows, macOS — březen 2026*
