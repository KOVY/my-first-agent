# 🎯 Workshop Guide — Tvůj AI Agent za jedno odpoledne

> Krok za krokem. Potřebuješ: notebook s internetem. To je vše.
> Otestováno na Linux, Mac i Windows.

---

## Co budeš mít na konci

✅ Vlastního AI agenta s jménem, pamětí a osobností
✅ Agent v terminálu (Gemini nebo Qwen — zdarma)
✅ Webchat v prohlížeči (OpenClaw)
✅ Připojení na Discord komunitu
✅ Zdarma — žádná kreditka

---

## Fáze 1: Příprava systému (10 minut)

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
> Node musí být 22.x nebo vyšší.

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

> ⚠️ **Důležité!** Bez tohoto kroku nebudou příkazy `gemini`, `qwen` a `openclaw` nalezeny.

### Krok 5: Stáhni starter kit

```bash
mkdir -p ~/openclaw && cd ~/openclaw
git clone https://github.com/KOVY/my-first-agent.git
cd my-first-agent
```

> ✅ **Checkpoint:** Node.js funguje, repo stažené. Jedeme dál!

---

## Fáze 2: AI Engine — vyber si (5 minut)

Máš na výběr dva free AI enginy. Oba fungují skvěle:

### Varianta A: Gemini CLI (Google) ⭐ doporučujeme

```bash
npm install -g @google/gemini-cli
```

Spusť:
```bash
gemini
```

Při prvním spuštění se otevře prohlížeč → **přihlas se Google účtem**. Zdarma, bez limitu.

Vyzkoušej:
```
Ahoj! Řekni mi vtip.
```

Ukonči: `Ctrl + C`

### Varianta B: Qwen Code (Alibaba)

```bash
npm install -g @qwen-code/qwen-code@latest
```

Spusť:
```bash
qwen
```

Napiš `/auth` → přihlas se přes prohlížeč. Zdarma, 1000 požadavků/den.

Vyzkoušej:
```
Ahoj! Řekni mi vtip.
```

Ukonči: `Ctrl + C`

> ✅ **Checkpoint:** AI odpovídá v terminálu. Máš svůj engine!

---

## Fáze 3: Dej agentovi identitu (10 minut)

### Krok 6: Vyplň SOUL.md — kdo je tvůj agent

```bash
cp examples/SOUL-example.md SOUL.md
nano SOUL.md   # uprav podle sebe
```
> (nebo `code SOUL.md` pokud máš VS Code)

Vyplň: jméno, osobnost, hodnoty, styl. Čím víc detailů, tím víc je agent "tvůj".

### Krok 7: Vyplň USER.md — kdo jsi ty

```bash
cp examples/USER-example.md USER.md
nano USER.md   # uprav podle sebe
```

Napiš: své jméno, jak tě má oslovovat, čím se zabýváš.

### Krok 8: Spusť agenta s identitou 🎉

```bash
gemini    # nebo: qwen
```

Napiš:
```
Přečti si SOUL.md a USER.md a představ se mi. Kdo jsi a kdo jsem já?
```

**Agent tě zná jménem a chová se podle SOUL.md!**

> ✅ **Checkpoint:** Agent má jméno, osobnost a ví kdo jsi. Základ hotov!

---

## Fáze 4: OpenClaw — webchat v prohlížeči (10 minut)

### Krok 9: Nainstaluj OpenClaw

```bash
npm install -g openclaw
```

> 💡 Pokud `openclaw` příkaz nefunguje → zavři a znovu otevři terminál (PATH z Kroku 4).

### Krok 10: Nastav OpenClaw

```bash
cd ~/openclaw/my-first-agent
openclaw
```

OpenClaw tě provede nastavením:
- **Model:** vyber Gemini nebo Qwen (stále zdarma)
- Ostatní nastavení přeskoč (Enter) — dodáme na Discordu

### Krok 11: Spusť webchat! 🌐

```bash
openclaw gateway start
```

Otevři prohlížeč → **http://localhost:18789**

Tvůj agent je online! Napíš mu:
```
Ahoj, kdo jsi? Co všechno umíš?
```

> ✅ **Checkpoint:** Webchat funguje, agent odpovídá v prohlížeči.

---

## Fáze 5: Komunita — KOWEX Discord (5 minut)

### Krok 12: Připoj se na Discord

1. Otevři **https://discord.gg/HfBkbD2k**
2. Vytvoř účet nebo se přihlas
3. Napiš do `#general`: **"Ahoj, jsem [tvoje jméno] a můj agent se jmenuje [jméno agenta]!"**

**Alan Spark** (AI CEO) tě přivítá a pomůže s dalším nastavením:
- 🔌 Propojení agenta s Telegramem, Discordem, emailem
- 🧩 Instalace skills (počasí, web search, email...)
- 🤖 Pokročilé funkce (paměť, cron joby, multi-agent)
- 💡 Inspirace co všechno tvůj agent umí

### Discord bot (volitelné)

Chceš aby tvůj agent odpovídal na Discordu 24/7?
```bash
bash scripts/setup-discord-bot.sh
```
Nebo podrobný návod: [DISCORD-BOT-SETUP.md](DISCORD-BOT-SETUP.md)

> ✅ **Checkpoint:** Jsi v komunitě. Gratulujeme — máš vlastního AI agenta! 🎉

---

## ❓ Časté problémy

| Problém | Řešení |
|---------|--------|
| `command not found: node` | Nainstaluj Node.js 22+ (Krok 2), restart terminálu |
| `command not found: gemini` | `npm install -g @google/gemini-cli`, restart terminálu |
| `command not found: qwen` | `npm install -g @qwen-code/qwen-code@latest`, restart terminálu |
| `command not found: openclaw` | `npm install -g openclaw`, restart terminálu |
| `EACCES: permission denied` | Viz Krok 4 (PATH nastavení) |
| Agent neodpovídá česky | Přidej do SOUL.md: `**Jazyk:** čeština` |
| Agent nezná mé jméno | Vyplň USER.md a restartuj agenta |
| Sudo heslo se nezobrazuje | Normální — piš a stiskni Enter |
| OpenClaw se ptá na API klíč | Přeskoč (Enter), nastav Gemini/Qwen |
| Webchat nejde otevřít | `openclaw gateway status`, případně restart |

---

## ⏱️ Časový plán workshopu

| Čas | Fáze | Co děláme |
|-----|------|-----------|
| 0:00–0:10 | 1. Základy | Node.js 22+, Git, PATH, repo |
| 0:10–0:15 | 2. AI Engine | Gemini nebo Qwen — první konverzace |
| 0:15–0:25 | 3. Identita | SOUL.md, USER.md — agent je "tvůj" |
| 0:25–0:35 | 4. OpenClaw | Webchat v prohlížeči |
| 0:35–0:40 | 5. Komunita | Discord — sdílení a networking |
| 0:40+ | Bonus | Customizace, skills, propojení, experimenty |

> 💡 **Realisticky:** Počítej 60–90 minut celkem (lidi mají různé systémy). Zbytek = hraní si s agentem, sdílení na Discordu, networking.

---

## 📞 Pomoc

- **Discord:** [KOWEX Community](https://discord.gg/HfBkbD2k) (Alan Spark 24/7)
- **Email:** alan.spark@kowexconsulting.cz
- **Telefon:** +420 608 010 686

---

*Vytvořeno pro Phantom Office Workshop — KOWEX Co. Holding*
*Aktualizováno: 9. března 2026*
