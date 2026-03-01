# 🎯 Workshop Guide — Tvůj AI Agent za 30 minut

> Otestováno na čistém Linuxu (Lenovo G50, Ubuntu). Krok za krokem.
> Potřebuješ: notebook s internetem. To je vše.

---

## Fáze 1: Základy (terminál — 10 minut)

### Krok 1: Otevři terminál

- **Linux:** `Ctrl + Alt + T`
- **Mac:** Spotlight (`Cmd + Space`) → `Terminal`
- **Windows:** `Win + R` → `cmd` (doporučujeme WSL2)

### Krok 2: Nainstaluj základní nástroje

**Node.js 22+ (povinné):**

Linux:
```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash - && sudo apt-get install -y nodejs
```

Mac:
```bash
brew install node
```

Windows (PowerShell jako Admin):
```powershell
winget install OpenJS.NodeJS.LTS
```

**Git (povinné):**

Linux:
```bash
sudo apt-get install -y git
```

Mac:
```bash
xcode-select --install
```

Windows:
```cmd
winget install Git.Git
```

> 💡 **Sudo heslo:** Na Linuxu/Macu se při psaní hesla nezobrazují žádné znaky — to je normální! Jen piš a stiskni Enter.

Po instalaci **zavři a znovu otevři terminál**, pak ověř:
```bash
node --version && git --version
```

### Krok 3: Nastav PATH pro npm globální balíčky

```bash
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH="$HOME/.npm-global/bin:$PATH"
echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.bashrc
```

> ⚠️ **Důležité!** Bez tohoto kroku OpenClaw příkaz nebude nalezen.

### Krok 4: Stáhni starter kit

```bash
mkdir -p ~/openclaw
cd ~/openclaw
git clone https://github.com/KOVY/my-first-agent.git
cd my-first-agent
```

---

## Fáze 2: Qwen Code — agent v terminálu (5 minut)

### Krok 5: Nainstaluj a přihlas se do Qwen

```bash
npm install -g @qwen-code/qwen-code@latest
qwen
```

V Qwen Code napiš:
```
/auth
```

Otevře se prohlížeč → přihlas se (Google účet). **Zdarma**, 1000 požadavků/den.

Vyzkoušej:
```
Ahoj! Přečti si SOUL.md a USER.md a představ se.
```

> ✅ **Checkpoint:** Qwen Code funguje, agent odpovídá. Ukonči: `Ctrl + C`

---

## Fáze 3: Discord — připoj se ke komunitě (5 minut)

> ⚠️ **Tento krok udělejte TEĎ, než spustíte webchat!**

### Krok 6: Nainstaluj Discord

Linux:
```bash
sudo snap install discord
```

> Nemáš snap? `wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb" && sudo dpkg -i discord.deb && sudo apt-get install -f -y`

Mac:
```bash
brew install --cask discord
```

Windows:
```cmd
winget install Discord.Discord
```

### Krok 7: Připoj se k KOWEX Community

1. Spusť Discord
2. Vytvoř účet (nebo se přihlas)
3. Klikni na invite: **https://discord.gg/HfBkbD2k**
4. Napiš do `#general`: "Ahoj, jsem [tvoje jméno] a můj agent se jmenuje [jméno agenta]!"

**Alan Spark** (AI CEO) tě přivítá. Je tam 24/7. ⚡

> ✅ **Checkpoint:** Jsi na Discordu v KOWEX Community.

---

## Fáze 4: OpenClaw — webchat v prohlížeči (10 minut)

### Krok 8: Nainstaluj OpenClaw

```bash
cd /tmp && npm pack openclaw@latest
npm install -g ./openclaw-*.tgz
```

> 💡 Pokud `openclaw` příkaz nefunguje, zavři a znovu otevři terminál (kvůli PATH z Kroku 3).

### Krok 9: Nastav Qwen jako výchozí model (ZDARMA)

```bash
openclaw plugins enable qwen-portal-auth
openclaw models auth login --provider qwen-portal --set-default
openclaw models set qwen-portal/coder-model
```

> ⚠️ **Důležité:** Pokud se OpenClaw ptá na Anthropic API klíč — přeskoč ho (Enter). Qwen je zdarma a funguje skvěle.

### Krok 10: Vyplň identitu agenta

Otevři `SOUL.md` v textovém editoru a vyplň (nebo zkopíruj příklad):

```bash
cp examples/SOUL-example.md SOUL.md
cp examples/USER-example.md USER.md
nano SOUL.md   # uprav podle sebe
nano USER.md   # uprav podle sebe
```

> 💡 **Tip:** Čím víc detailů v SOUL.md, tím víc je agent "tvůj". Ale i s příkladem to funguje hned.

### Krok 11: Spusť webchat! 🎉

```bash
cd ~/openclaw/my-first-agent
openclaw gateway --port 18789
```

Otevři prohlížeč → **http://localhost:18789**

Tvůj agent je tam! Napíš mu:
```
Ahoj, kdo jsi? Představ se.
```

> ✅ **Checkpoint:** Webchat funguje, agent se představil jménem z SOUL.md.

---

## Fáze 5: Propojení (bonus — 5 minut)

### Browser Relay (agent vidí tvůj prohlížeč)

V Chrome/Edge nainstaluj rozšíření **OpenClaw Browser Relay**:
1. Otevři `chrome://extensions`
2. Hledej "OpenClaw" nebo stáhni z Chrome Web Store
3. Klikni na ikonku rozšíření → Attach Tab

Tvůj agent teď vidí co máš otevřené v prohlížeči a může ti pomáhat přímo na stránkách.

### Discord bot (agent píše na Discord)

Pokud chceš aby tvůj agent automaticky odpovídal na Discordu:
1. Vytvoř bota: https://discord.com/developers/applications
2. Nastav v OpenClaw: `openclaw config set channels.discord.token "TVŮ_BOT_TOKEN"`
3. Agent je teď na Discordu 24/7

> Tento krok je pokročilý — Alan Spark na Discordu ti rád pomůže.

---

## ❓ Časté problémy

### "command not found: openclaw"
```bash
export PATH="$HOME/.npm-global/bin:$PATH"
```
Nebo zavři a znovu otevři terminál.

### "command not found: qwen"
Zavři a znovu otevři terminál. Pokud nepomůže: `npm install -g @qwen-code/qwen-code@latest`

### "command not found: node"
Nainstaluj Node.js (viz Krok 2).

### "command not found: git"
Nainstaluj git (viz Krok 2).

### Sudo heslo / "Permission denied"
Zadej heslo k přihlášení do počítače. Při psaní se nezobrazují znaky — to je normální.

### OpenClaw se ptá na Anthropic API klíč
Přeskoč (Enter). Nastav Qwen: `openclaw models set qwen-portal/coder-model`

### Agent neodpovídá česky
Přidej do SOUL.md: `**Jazyk:** čeština`

### Agent nezná mé jméno
Vyplň USER.md a restartuj gateway (`Ctrl + C`, spusť znovu).

---

## 📞 Pomoc

- **Discord:** https://discord.gg/HfBkbD2k (@Alan Spark pomůže)
- **GitHub:** https://github.com/KOVY/my-first-agent (issues)
- **Email:** alan.spark@kowexconsulting.cz

---

## ⏱️ Časový plán workshopu

| Čas | Co děláme |
|-----|-----------|
| 0:00–0:10 | Fáze 1: Instalace základů (Node, Git, PATH) |
| 0:10–0:15 | Fáze 2: Qwen Code — první konverzace s agentem |
| 0:15–0:20 | Fáze 3: Discord — připojení ke komunitě |
| 0:20–0:30 | Fáze 4: OpenClaw webchat — plný agent v prohlížeči |
| 0:30+ | Fáze 5: Customizace, propojení, experimenty |

> 💡 **Realisticky:** Počítej s 45–60 minut pro celý setup (lidi mají různé systémy). Zbytek času = hraní si s agentem, sdílení na Discordu, networking.

---

*Vytvořeno pro Phantom Office Workshop — KOWEX Co. Holding*
*Otestováno na Ubuntu Linux (Lenovo G50) — 1. března 2026*
