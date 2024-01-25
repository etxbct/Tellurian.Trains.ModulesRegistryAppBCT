## Fraktkunder og frakter
En viktig del av ett trafikspil er frakt.
Fraktene kan styres p� to m�ter:
� Vogne i fast turnus, hvor de kj�rer p� ruteplan.
- Vognlast styret av fraktbrev.

### Fraktbrev
I **Modulregisteret** kan fraktbrev produseres p� to m�ter:
- Fraktbrev som kan gjenbrukes fra treff til treff.
- Fraktbrev for frakt mellom godsstasjonene som er i et bestemt m�teoppsett.

**Modulregisteret** har i utgangspunktet de samme funksjonene som *Gule sider*, men med noen forskjeller.

### Fraktkunder
I **Modulregisteret** legger du inn fraktkunder og fraktstr�mmer som varer sendes og mottas for.
Du kan legge inn fraktkunder og varestr�mmer for din egen modulstasjon,
men ogs� for *eksterne stasjoner*.

En *ekstern stasjon* er en reell stasjon som skal legges inn med historisk korrekte data
om stasjonen, dens kunder og godsstr�mmer.

### Slik lages fraktsedler
I motsetning til *Gule sider*, kan du ikke manuelt lage fraktsedler selv i **Modulregisteret**.
I stedet oppretter applikasjonen fraktsedler ved � matche fraktflyten til avsendende og mottakende fraktkunder.
Matchningen gj�res p� f�lgende data:
- **Tema** for sende- og mottaksstasjonen m� samsvare. Dette forhindrer f.eks. amerikanske og europeiske temaer er blandet.
- **Skala** for � unng� � lage frakt mellom moduler av ulik skala. Eksterne stasjoner har ingen skala, s� de matches uansett skala.
- **Type last** m� samsvare. Dette matches p� lastens interne id, og ikke p� navnet. Et tilpasset lastetypenavn *p�virker* ikke samsvaret.
- **�r** m� overlappe: tidsperiodene for *type gods*, *sendings- og mottaksstasjon og fraktf�r*.
Dette betyr at fraktsedler lages historisk n�yaktige.

### Tilpass og skriv ut fraktsedler
Fraktbrevene som opprettes kan tilpasses p� flere m�ter:
- Antall som skal skrives ut.
- Hvis du �nsker � skrive ut et gitt antall eller spesifisert antall per operasjonsdag.
� Hvis du vil ha returfraktbrev for en tomvogn.

For avg�ende vognlass kan du ogs� skrive ut tomme vognbestillinger, som du legger inn p� skyggebaneg�rden.