# 🎯 Workshop Guide — Tvůj AI Agent za 30 minut

> Tento návod tě provede od nuly k fungujícímu AI agentovi. Krok za krokem.
> Potřebuješ: notebook s internetem. To je vše.

---

## Krok 1: Nainstaluj Node.js (pokud nemáš)

Ověř jestli máš Node.js:
```bash
node --version
```

Pokud vidíš `v20.x.x` nebo vyšší → jdi na Krok 2.

Pokud ne → nainstaluj jedním příkazem:

**Windows (PowerShell jako Admin):**
```powershell
winget install OpenJS.NodeJS.LTS
```

**Mac:**
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash && source ~/.bashrc && nvm install --lts
```

**Linux (Ubuntu/Debian):**
```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash - && sudo apt-get install -y nodejs
```

Po instalaci **zavři a znovu otevři terminál**, pak ověř: `node --version`

**Jak otevřít terminál:**
- **Windows:** Stiskni `Win + R`, napiš `cmd`, Enter
- **Mac:** Spotlight (`Cmd + Space`), napiš `Terminal`, Enter
- **Linux:** `Ctrl + Alt + T`

---

## Krok 2: Nainstaluj Qwen Code (2 minuty)

**Mac / Linux:**
```bash
curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.sh | bash
```

**Windows:**
```cmd
curl -fsSL -o %TEMP%\install-qwen.bat https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.bat && %TEMP%\install-qwen.bat
```

**Alternativa (funguje všude):**
```bash
npm install -g @qwen-code/qwen-code@latest
```

Po instalaci **zavři a znovu otevři terminál**.

---

## Krok 3: Přihlaš se do Qwen (1 minuta)

Spusť Qwen:
```bash
qwen
```

V Qwen Code napiš:
```
/auth
```

Otevře se prohlížeč → přihlas se (Google účet nebo email). Je to **zdarma** — 1000 požadavků denně, žádná kreditka.

Po přihlášení se vrať do terminálu. Měl bys vidět potvrzení.

---

## Krok 4: Nainstaluj Git a stáhni starter kit (2 minuty)

Ověř jestli máš git:
```bash
git --version
```

Pokud ne, nainstaluj:

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get install -y git
```

**Mac:**
```bash
xcode-select --install
```

**Windows:**
```cmd
winget install Git.Git
```

> 💡 Na Linuxu/Macu budeš potřebovat heslo administrátora (sudo). Pokud ho neznáš, zeptej se toho, kdo ti nastavoval počítač.

Teď stáhni starter kit:
```bash
mkdir -p ~/muj-agent
cd ~/muj-agent
git clone https://github.com/KOVY/my-first-agent.git
cd my-first-agent
```

> 💡 Alternativa bez gitu: Stáhni ZIP z https://github.com/KOVY/my-first-agent → zelené tlačítko "Code" → "Download ZIP" → rozbal → otevři složku v terminálu.

---

## Krok 5: Dej agentovi identitu (5 minut)

Otevři soubor `SOUL.md` v jakémkoliv textovém editoru (Notepad, VS Code, nano...).

Vyplň šablonu. Příklad:

```markdown
## Jméno
**Jméno:** Viktor

## Osobnost
**Vibe:** Přátelský, přímý, trochu sarkastický

## Role
**Role:** Můj osobní byznys asistent

## Hodnoty
1. Buď stručný a k věci
2. Navrhuj řešení, ne jen problémy
3. Když nevíš, řekni to

## Styl komunikace
- **Jazyk:** čeština
- **Délka odpovědí:** krátké a výstižné
- **Oslovení:** tykání
```

Ulož soubor.

Stejně tak otevři `USER.md` a vyplň pár vět o sobě — jméno, co děláš, na čem pracuješ.

---

## Krok 6: Spusť agenta! 🎉 (30 sekund)

```bash
qwen
```

Tvůj agent se spustí a přečte si SOUL.md a USER.md. Zkus mu napsat:

```
Ahoj, kdo jsi?
```

Měl by se představit jménem, které jsi mu dal! Zkus další:

```
Podívej se na soubory v tomto projektu a řekni mi co tu je.
```

```
Jaké je dnes počasí v Praze?
```

```
Najdi mi na webu co je OpenClaw.
```

**Gratulace — máš svého prvního AI agenta!** 🤖

---

## Krok 7: Připoj se ke komunitě (2 minuty)

Nemáš Discord? Nainstaluj jedním příkazem:

**Linux (Ubuntu/Debian):**
```bash
sudo snap install discord
```

> Nemáš snap? Alternativa: `sudo apt install -y flatpak && flatpak install flathub com.discordapp.Discord -y`
>
> Nebo stáhni .deb z https://discord.com/api/download?platform=linux&format=deb a nainstaluj: `sudo dpkg -i discord-*.deb`

**Mac:**
```bash
brew install --cask discord
```

**Windows:**
```cmd
winget install Discord.Discord
```

Po instalaci spusť Discord, vytvoř si účet (nebo se přihlas) a klikni na invite link:

1. **https://discord.gg/HfBkbD2k**
3. Připoj se na server **KOWEX Community**
4. Napiš do kanálu `#show-your-agent`:
   - Jak se tvůj agent jmenuje?
   - Co umí?
   - Screenshot konverzace!

**Alan Spark** (AI CEO) tě přivítá a pomůže s čímkoliv. Je tam 24/7.

---

## 🔒 Bonus: Zabezpečení (volitelné, 2 minuty)

Chceš mít svého agenta dostupného bezpečně odkudkoliv? Nainstaluj [Tailscale](https://tailscale.com) — zdarma, šifrovaná síť, žádná konfigurace.

**Jeden příkaz:**

**Linux:**
```bash
curl -fsSL https://tailscale.com/install.sh | sh && sudo tailscale up
```

**Mac:**
```bash
brew install tailscale && tailscale up
```

**Windows:**
Stáhni z https://tailscale.com/download/windows

Po přihlášení (Google účet) máš bezpečné spojení mezi všemi svými zařízeními. Tvůj agent běží doma, ty se připojíš z kavárny, vlaku, odkudkoliv.

---

## 🔥 Bonus: Co dál?

### Agent si pamatuje
Vytvoř složku `memory/` a agent si tam bude zapisovat poznámky mezi sessions:
```bash
mkdir -p memory
```

### Přidej skills
V složce `skills/` jsou dvě dovednosti (web search, počasí). Můžeš přidat vlastní — stačí vytvořit složku s `SKILL.md`.

### Přejdi na OpenClaw (level 2)
Pokud chceš agenta který:
- 📱 Běží 24/7 a píše ti na Telegram/WhatsApp/Discord
- 🤝 Spolupracuje s dalšími agenty
- 🔄 Pracuje i když spíš

→ https://openclaw.ai — a tvůj starter kit je s ním plně kompatibilní.

---

## ❓ Časté problémy

### "command not found: qwen"
Zavři a znovu otevři terminál. Pokud nepomůže: `npm install -g @qwen-code/qwen-code@latest`

### "command not found: git"
Nainstaluj: `sudo apt-get install -y git` (Linux) / `xcode-select --install` (Mac) / `winget install Git.Git` (Windows). Nebo stáhni ZIP (viz Krok 4).

### Sudo heslo / "Permission denied"
Na Linuxu/Macu některé instalace vyžadují administrátorské heslo. Zadej heslo, které používáš k přihlášení do počítače. Při psaní hesla se nezobrazují žádné znaky — to je normální, jen piš a stiskni Enter.

### "command not found: node"
Nainstaluj Node.js z https://nodejs.org

### Agent neodpovídá česky
Přidej do SOUL.md: `**Jazyk:** čeština`

### Agent nezná mé jméno
Vyplň USER.md a restartuj agenta (ukonči `Ctrl+C`, spusť znovu `qwen`).

---

## 📞 Pomoc

- **Discord:** https://discord.gg/HfBkbD2k (Alan Spark + komunita)
- **GitHub:** https://github.com/KOVY/my-first-agent (issues)
- **Email:** alan.spark@kowexconsulting.cz

---

*Vytvořeno pro Phantom Office Workshop — KOWEX Co. Holding*
*"Za 10 minut máš vlastního AI agenta. Zdarma."*
