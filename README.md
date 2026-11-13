# Petrini Dentista

Core WordPress verificato, temi standard e script di avvio per la copia di sviluppo. Il sito ripristinato dal backup WPvivid e il database locale sono necessari per avviare l'ambiente.

Dalla cartella della copia locale, esegui `./start.sh`. Servono PHP e MySQL. Il sito è disponibile su http://localhost:8765/.

Tieni fuori da Git il database, i backup, i media e la configurazione WordPress. Il tema attivo Bricks e i plugin si ripristinano dal backup locale. Per versionare un futuro tema child o plugin personalizzato, aggiungi al repository soltanto il codice del componente. Le modifiche alle pagine fatte in Bricks sono salvate nel database.
