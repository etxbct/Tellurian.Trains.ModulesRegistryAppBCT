## Fragtkunder og fragter
En vigtig del af en k�replansession er fragt.
Fragterne kan styres p� to m�der:
- Vogne i fast turnus, hvor de k�rer efter k�replan.
- Vogne styret af fragtbreve.

### Fragtbreve
I **Modulregistret** kan fragtbreve fremstilles p� to m�der:
- Fragtbreve, der kan genbruges fra m�de til m�de.
- Fragtbreve for fragt mellem godsstationerne, der er i et bestemt m�delayout.

**Modulregistret** har grundl�ggende de samme funktioner som *De Gule Sider*, men med nogle forskelle.

### Fragtkunder
I **Modulregistret** indtaster du fragtkunder og fragtstr�mme, som varer sendes og modtages for.
Du kan indtaste fragtkunder og varestr�mme til din egen modulstation,
men ogs� for *eksterne stationer*.

En *ekstern station* er en rigtig station, der skal indtastes med historisk korrekte data
om stationen, dens kunder og godsstr�mme.

### S�dan oprettes fragtbreve
I mods�tning til *De Gule Sider* kan du ikke selv oprette fragtbreve manuelt i **Modulregisteret**.
I stedet opretter applikationen fragtbreve ved at matche fragtstr�mmen for de afsendende og modtagende fragtkunder.
Matchningen foretages p� f�lgende data:
- **Tema** for sende- og modtagestationen skal matche. Dette forhindrer f.eks. amerikanske og europ�iske temaer er blandet.
- **Skala** for at undg� at skabe fragt mellem moduler af forskellig skala. Eksterne stationer har ingen skala, s� de matches uanset skala.
- **Type af vare** skal matche. Dette matches p� varens interne id og ikke p� navnet. Et tilpasset varenavn p�virker *ikke* matchningen.
- **�r** skal overlappe: tidsperioderne for *varetype*, *sende- og modtagestation og fragtfoder*.
Det betyder, at fragtbreve er skabt historisk n�jagtige.

### Tilpas og udskriv fragtbreve
De fragtbreve, der oprettes, kan tilpasses p� flere m�der:
- Antal til udskrivning.
- Hvis du �nsker at udskrive et givet antal eller angivet antal pr. trafikdag.
- Hvis du vil have et returfragtbrev for en tomvogn.

Ved afg�ende vognl�s kan du ogs� printe tomme vognordrer, som du afgiver p� skyggebaneg�rden.