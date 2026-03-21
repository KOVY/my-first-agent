#!/usr/bin/env bash
# =============================================================
# 🤖 My First Agent — Interaktivní nastavení agenta
# =============================================================
# Tento skript se tě zeptá na pár věcí a automaticky
# vygeneruje SOUL.md a USER.md pro tvého agenta.
# Funguje na Linux, Mac a WSL (Windows).
# =============================================================

set -euo pipefail

# Barvy (nepovinné — funguje i bez nich)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color (reset)

clear

echo -e "${CYAN}${BOLD}"
echo "  ┌─────────────────────────────────────────┐"
echo "  │   🤖  Nastavení tvého AI agenta          │"
echo "  │   My First Agent — Workshop Setup        │"
echo "  └─────────────────────────────────────────┘"
echo -e "${NC}"
echo ""
echo "Za chvíli budeš mít vlastního AI agenta."
echo "Stačí odpovědět na pár otázek (Enter = výchozí hodnota)."
echo ""
echo "────────────────────────────────────────────"
echo ""

# ---------------------------------------------------------
# Krok 1: Jméno agenta
# ---------------------------------------------------------
echo -e "${BOLD}1) Jak se bude tvůj agent jmenovat?${NC}"
echo "   (Příklady: Nova, Atlas, Spark, Zora, Max, Alena)"
echo -n "   Jméno agenta [Nova]: "
read -r AGENT_NAME
AGENT_NAME="${AGENT_NAME:-Nova}"
echo ""

# ---------------------------------------------------------
# Krok 2: Styl osobnosti
# ---------------------------------------------------------
echo -e "${BOLD}2) Jaký styl osobnosti chceš?${NC}"
echo "   1 = Profesionální  (přesný, formální, spolehlivý)"
echo "   2 = Přátelský      (teplý, povzbudivý, kamarádský)"
echo "   3 = Vtipný         (lehký, s humorem, nebere vše vážně)"
echo "   4 = Vlastní        (napíšeš sám)"
echo -n "   Tvoje volba [2]: "
read -r STYLE_CHOICE
STYLE_CHOICE="${STYLE_CHOICE:-2}"
echo ""

case "$STYLE_CHOICE" in
  1)
    STYLE_LABEL="Profesionální"
    STYLE_DESC="Jsem přesný, strukturovaný a spolehlivý. Komunikuji formálně, věcně a efektivně. Doručuji výsledky bez zbytečných odbočení."
    ;;
  3)
    STYLE_LABEL="Vtipný"
    STYLE_DESC="Mám smysl pro humor. Neberu vše smrtelně vážně — ale moje rady jsou stejně kvalitní. Rád odlehčím situaci vtipem ve správný moment."
    ;;
  4)
    echo -e "${BOLD}Napiš svůj vlastní popis osobnosti:${NC}"
    echo -n "   > "
    read -r STYLE_DESC
    STYLE_LABEL="Vlastní"
    ;;
  *)
    STYLE_LABEL="Přátelský"
    STYLE_DESC="Jsem teplý, povzbudivý a kamarádský. Komunikuji přirozeně, bez formalit. Jsem tady pro tebe a vždy se snažím pomoci s dobrým pocitem."
    ;;
esac

# ---------------------------------------------------------
# Krok 3: Jméno uživatele
# ---------------------------------------------------------
echo -e "${BOLD}3) Jak se jmenuješ? (aby tě agent znal)${NC}"
echo -n "   Tvoje jméno [Příteli]: "
read -r USER_NAME
USER_NAME="${USER_NAME:-Příteli}"
echo ""

# ---------------------------------------------------------
# Krok 4: Jazyk
# ---------------------------------------------------------
echo -e "${BOLD}4) Jazyk komunikace?${NC}"
echo "   1 = Čeština  (výchozí)"
echo "   2 = Angličtina"
echo -n "   Tvoje volba [1]: "
read -r LANG_CHOICE
LANG_CHOICE="${LANG_CHOICE:-1}"
echo ""

if [[ "$LANG_CHOICE" == "2" ]]; then
  LANG="English"
  LANG_NOTE="**Language:** English"
else
  LANG="Čeština"
  LANG_NOTE="**Jazyk:** Čeština"
fi

# ---------------------------------------------------------
# Generování SOUL.md
# ---------------------------------------------------------
SOUL_FILE="$(dirname "$0")/../SOUL.md"
cat > "$SOUL_FILE" << SOUL_EOF
# SOUL.md — ${AGENT_NAME}

> *"Jsem tady, abych ti pomohl. Každý den, každý dotaz, každý problém."*

---

## Kdo jsem

Jsem **${AGENT_NAME}** — tvůj osobní AI agent.

${STYLE_DESC}

---

## Styl komunikace

- **Osobnost:** ${STYLE_LABEL}
- ${LANG_NOTE}
- Vždy odpovím na věc — neztrácím čas zbytečnostmi
- Pamatuji si kontext (díky souborům v memory/)

---

## Jak pracuji

**Akce > slova.** Místo vysvětlování rovnou pomáhám.

**Ptám se, až když je to nutné.** Nejdřív zkusím sám najít odpověď.

**Pamatuji si.** Zapisuji si důležité věci do memory/ — takže nezačínám každou session od nuly.

---

## Moje hodnoty

- Upřímnost — řeknu pravdu, i když není příjemná
- Efektivita — tvůj čas je cenný
- Zvídavost — rád se učím nové věci s tebou

---

*${AGENT_NAME} — tvůj AI agent*
*Generováno setup.sh — My First Agent Workshop*
SOUL_EOF

# ---------------------------------------------------------
# Generování USER.md
# ---------------------------------------------------------
USER_FILE="$(dirname "$0")/../USER.md"
cat > "$USER_FILE" << USER_EOF
# USER.md — ${USER_NAME}

| Atribut | Hodnota |
|---------|---------|
| Jméno | ${USER_NAME} |
| Oslovení | ${USER_NAME} |
| Jazyk | ${LANG} |

## O mně

Jmenuji se **${USER_NAME}**. Používám AI agenta ${AGENT_NAME} k tomu, abych byl efektivnější, lépe organizovaný a mohl rychleji dosahovat svých cílů.

## Jak mě agent oslovuje

Vždy mě oslovuje jako **${USER_NAME}**.

## Co ode mě očekávám

- Rychlé a přesné odpovědi
- Upřímnost — i když pravda není příjemná
- Aktivní pomoc, ne jen otázky

---

*Vygenerováno setup.sh — My First Agent Workshop*
USER_EOF

# ---------------------------------------------------------
# Shrnutí
# ---------------------------------------------------------
echo ""
echo -e "${GREEN}${BOLD}✅ Hotovo! Tvůj agent je připraven.${NC}"
echo ""
echo "  Agent:    ${AGENT_NAME}"
echo "  Styl:     ${STYLE_LABEL}"
echo "  Uživatel: ${USER_NAME}"
echo "  Jazyk:    ${LANG}"
echo ""
echo "────────────────────────────────────────────"
echo ""
echo -e "${BOLD}Jak spustit agenta:${NC}"
echo ""
echo "  V terminálu (Gemini):    gemini"
echo "  V terminálu (Qwen):      qwen"
echo "  Webchat (OpenClaw):      openclaw gateway start"
echo "                           → http://localhost:18789"
echo ""
echo "  První dotaz: 'Přečti si SOUL.md a USER.md a představ se mi.'"
echo ""
echo -e "${CYAN}Přijď nám říct jak se agent jmenuje!${NC}"
echo "  Discord: https://discord.gg/eYseucRWg4"
echo ""
