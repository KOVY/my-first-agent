# 🤖 My First Agent

**Za 10 minut máš vlastního AI agenta. Zdarma.**

Tento repozitář ti dá vše, co potřebuješ k vytvoření osobního AI asistenta — s vlastním jménem, pamětí a osobností. Žádné programování, žádná kreditka.

---

## 🚀 Rychlý start

### Krok 1: Nainstaluj Qwen Code (2 minuty)

**macOS / Linux:**
```bash
curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.sh | bash
```

**Windows:**
```cmd
curl -fsSL -o %TEMP%\install-qwen.bat https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.bat && %TEMP%\install-qwen.bat
```

> 💡 Potřebuješ [Node.js 20+](https://nodejs.org/en/download). Po instalaci restartuj terminál.

### Krok 2: Přihlas se (1 minuta)

```bash
qwen
```

V Qwen Code napiš:
```
/auth
```

Přihlas se přes prohlížeč — je to zdarma, 1000 požadavků denně.

### Krok 3: Klonuj tento repozitář (1 minuta)

```bash
git clone https://github.com/KOVY/my-first-agent.git
cd my-first-agent
```

### Krok 4: Vyplň kdo jsi (5 minut)

Otevři `SOUL.md` a vyplň šablonu — dej svému agentovi jméno, osobnost a hodnoty.
Otevři `USER.md` a napiš pár vět o sobě.

### Krok 5: Spusť agenta 🎉

```bash
qwen
```

Tvůj agent tě zná, ví kdo je, a je připravený pomáhat.

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

## ⚡ Chceš víc?

### OpenClaw — plný agentní systém

Pokud chceš agenta, který:
- 📱 Komunikuje přes Telegram, Discord, WhatsApp
- 🔄 Běží 24/7 i když nemáš otevřený terminál
- 🧩 Má pokročilé skills a automatizace
- 🤝 Spolupracuje s dalšími agenty

→ Podívej se na [OpenClaw](https://openclaw.ai) — [dokumentace](https://docs.openclaw.ai).

Tento starter kit je s OpenClaw plně kompatibilní. Stačí nainstalovat OpenClaw do tohoto adresáře a vše funguje dál.

---

## 🏢 Komunita

Připoj se k nám na Discordu — sdílej co tvůj agent umí, získej tipy, potkej další lidi s agenty:

👉 **[Discord — KOWEX Community](https://discord.gg/HfBkbD2k)**

---

## 📜 Licence

MIT — používej, upravuj, sdílej.

---

*Vytvořeno s ❤️ firmou [KOWEX Co. Holding](https://kowexconsulting.cz) — 9 firem, 13 AI agentů, 0 zaměstnanců.*
