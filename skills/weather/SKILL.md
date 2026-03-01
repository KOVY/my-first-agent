# Weather — Počasí

## Kdy použít
Když se uživatel ptá na počasí, teplotu nebo předpověď.

## Jak to funguje
Použij wttr.in — žádný API klíč, funguje hned.

```bash
curl "wttr.in/Praha?format=3"
curl "wttr.in/Praha?lang=cs"
```

## Příklady
- "Jaké bude počasí v Praze?" → `curl wttr.in/Praha?lang=cs`
- "Bude pršet?" → `curl "wttr.in/?format=%c+%t+%w"`
- Předpověď na 3 dny: `curl wttr.in/Praha`
