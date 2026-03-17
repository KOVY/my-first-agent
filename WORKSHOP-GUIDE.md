# 🎯 Workshop Guide — Tvůj AI Agent za jedno odpoledne

> Krok za krokem. Potřebuješ: notebook s internetem. To je vše.
> Otestováno na Linux, Mac i Windows.

---

## Co budeš mít na konci

✅ Vlastního AI agenta s jménem, pamětí a osobností
✅ Agent v terminálu (Gemini nebo Qwen — zdarma)
✅ Webchat v prohlížeči (OpenClaw — volitelné)
✅ Agent dostupný z mobilu odkudkoli (Tailscale)
✅ Připojení na Discord komunitu
✅ Zdarma — žádná kreditka

---

## Fáze 0: Tailscale — bezpečný přístup odkudkoli (2 minuty)

> 💡 **Proč Tailscale?** Tailscale vytváří bezpečnou soukromou síť mezi tvými zařízeními. Agent bude dostupný odkudkoli — z mobilu, z práce, z domu. **Bez otevírání portů, bez VPN, bez složitého nastavení.**

### Co Tailscale udělá za tebe

- Přidělí ti IP adresu ve tvaru `100.x.x.x`
- Na té adrese přistoupíš ke svému agentovi **odkudkoli**
- Všechno je šifrované — nikdo jiný se nedostane k tvému agentovi

### Krok 0: Nainstaluj Tailscale

| Systém | Postup |
|--------|--------|
| **Windows** | Stáhni a spusť: [tailscale-setup-1.94.2.exe](https://pkgs.tailscale.com/stable/tailscale-setup-1.94.2.exe) |
| **Mac** | `brew install tailscale` nebo stáhni z [tailscale.com/download/mac](https://tailscale.com/download/mac) |
| **Linux** | `curl -fsSL https://tailscale.com/install.sh \| sh && sudo tailscale up` |

Po instalaci se přihlas (Google nebo GitHub účet) — je to **zdarma**.

```bash
tailscale ip   # zjisti svou 100.x.x.x adresu — poznamenej si ji
```

> ✅ **Checkpoint:** Vidíš adresu začínající `100.` — Tailscale funguje!

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

### Krok 6: Dej agentovi jméno a osobnost

**Doporučeno — interaktivní skript (30 sekund):**
```bash
bash scripts/setup.sh
```
Skript se tě zeptá na:
- **Jméno agenta** (např. Nova, Atlas, Zora, Max...)
- **Styl osobnosti** (profesionální / přátelský / vtipný / vlastní)
- **Tvoje jméno** (aby tě agent znal)
- **Jazyk** (čeština nebo angličtina)

A automaticky vygeneruje `SOUL.md` a `USER.md`.

**Nebo ručně (plná kontrola):**
```bash
cp examples/SOUL-example.md SOUL.md
nano SOUL.md   # uprav podle sebe (uložit: Ctrl+O, ukončit: Ctrl+X)
cp examples/USER-example.md USER.md
nano USER.md   # napiš kdo jsi ty
```
> (nebo `code SOUL.md` pokud máš VS Code)

### Krok 7: Spusť agenta s identitou 🎉

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

### Krok 8: Nainstaluj OpenClaw

```bash
npm install -g openclaw
```

> 💡 Pokud `openclaw` příkaz nefunguje → zavři a znovu otevři terminál (PATH z Kroku 4).

### Krok 9: Nastav OpenClaw

```bash
cd ~/openclaw/my-first-agent
openclaw
```

OpenClaw tě provede nastavením — vyber Gemini nebo Qwen jako model (stále zdarma).

### Krok 10: Spusť webchat! 🌐

```bash
openclaw gateway start
```

Otevři prohlížeč → **http://localhost:18789**

**Přístup z mobilu nebo jiného zařízení (přes Tailscale):**
```
http://100.x.x.x:18789
```
*(místo `100.x.x.x` dosaď svou Tailscale IP z Fáze 0)*

> ✅ **Checkpoint:** Webchat funguje, agent odpovídá v prohlížeči a je dostupný z mobilu!

---

## Fáze 5: Komunita — KOWEX Discord (5 minut)

### Krok 11: Připoj se na Discord

1. Otevři **https://discord.gg/HfBkbD2k**
2. Vytvoř účet nebo se přihlas
3. Napiš do `#general`: **"Ahoj, jsem [tvoje jméno] a můj agent se jmenuje [jméno agenta]!"**

**Alan Spark** (AI CEO) tě přivítá a pomůže s dalším nastavením:
- 🔌 Propojení agenta s Telegramem, Discordem, emailem
- 🧩 Instalace skills (počasí, web search, email...)
- 🤖 Pokročilé funkce (paměť, cron joby, multi-agent)

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
| Tailscale IP nezobrazuje | `tailscale status` — ujisti se že jsi přihlášen |
| Mobil nevidí agenta | Oba přístroje musí být ve stejné Tailscale síti |

---

## ⏱️ Časový plán workshopu

| Čas | Fáze | Co děláme |
|-----|------|-----------|
| 0:00–0:02 | 0. Tailscale | Instalace, bezpečný přístup odkudkoli |
| 0:02–0:12 | 1. Základy | Node.js 22+, Git, PATH, repo |
| 0:12–0:17 | 2. AI Engine | Gemini nebo Qwen — první konverzace |
| 0:17–0:27 | 3. Identita | setup.sh nebo SOUL.md + USER.md ručně |
| 0:27–0:37 | 4. OpenClaw | Webchat v prohlížeči |
| 0:37–0:42 | 5. Komunita | Discord — sdílení a networking |
| 0:42+ | Bonus | Mobil přes Tailscale, Discord bot, skills, experimenty |

> 💡 **Realisticky:** Počítej 60–90 minut celkem. Zbytek = hraní si s agentem, sdílení na Discordu, networking.

---

## 📞 Pomoc

- **Discord:** [KOWEX Community](https://discord.gg/HfBkbD2k) (Alan Spark 24/7)
- **Email:** alan.spark@kowexconsulting.cz
- **Telefon:** +420 608 010 686

---

*Vytvořeno pro Phantom Office Workshop — KOWEX Co. Holding*
*Aktualizováno: 17. března 2026*
