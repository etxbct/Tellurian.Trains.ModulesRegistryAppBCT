## Godskunder och frakter
En viktig del av ett trafikspel �r frakter.
Frakterna kan styras p� tv� s�tt:
- Vagnar i fasta omlopp, d�r de g�r p� tidtabell.
- Vagnlaster som styrs med fraktsedlar.

### Fraktsedlar
I **Modulregistret** kan man producera fraktsedlar p� tv� s�tt:
- Per trafikplats d�r man skapar fraktsedlar som kan �teranv�ndas fr�n tr�ff till tr�ff.
- Fraktsedlar f�r frakter mellan de trafikplatser som finns med p� en viss tr�ff.

Modulregistret har i princip samma funktioner som *Gula Sidorna*, men med vissa skillnader.

### Godskunder
I **Modulregistret** l�gger man in godskunder och godsfl�den f�r vilka varor som skickas och mottas.
Man kan l�gga in godskunder och godsfl�den f�r sin egen modulstation, 
men �ven f�r *externa stationer*.

En *extern station* �r en verklig station som m�ste l�ggas in med historiskt korrekta data
om stationen, dess kunder och godsfl�den.

### S� h�r skapas fraktsedlar
Till skillnad fr�n *Gula Sidorna* kan man inte sj�lv skapa valfria fraktsedlar i **Modulregistret**.
Ist�llet skapar applikationen fraktsedlar genom att matcha avs�ndande och mottagande godskunders godsfl�de.
Matchningen g�rs p� f�ljande data:
- **Tema** f�r avs�ndande och mottagande station skall �verensst�mma. Detta f�rhindrar att t.ex. amerikanskt och europeiskt tema blandas.
- **Skala** f�r att undvika att skapa fratsedlar mellan moduler av olika skala. Externa stationer har ingen skala, s� de matchas oavsett skala.
- **Typ av last** skall �verensst�mma. Detta matchas p� lastens interna id, och inte p� namnet. Ett eget namn p� lasttypen p�verkar *inte* matchningen.
- **�rtal** skall �verlappa: tidsperioderna f�r *typ av gods*, *avs�ndande och mottagande station och godsf�de*. 
Detta inneb�r att fraktsedlar blir historikst korrekta.

### Anpassa och skriva ut fraktsedlar
De fraktsedlar som skapas kan anpassas p� flera s�tt:
- Antal att skriva ut.
- Om man vill skriva ut givet antal eller angivet antal per trafikdag.
- Om man vill ha en returfraktsedel f�r tomvagn.

F�r avg�ende vagnslatser kan kan �ven skriva ut tomvagnsbest�llningar, fraktsedlar som man placerar vid t�gmagasin.
