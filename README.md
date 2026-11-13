# Petrini Dentista

Core WordPress verificato, temi standard e script di avvio per la copia di sviluppo. Il sito ripristinato dal backup WPvivid e il database locale sono necessari per avviare l'ambiente.

Dalla cartella della copia locale, esegui `./start.sh`. Servono PHP e MySQL. Il sito è disponibile su http://localhost:8765/.

Tieni fuori da Git il database, i backup, i media e la configurazione WordPress. Il tema attivo Bricks e i plugin si ripristinano dal backup locale. Per versionare un futuro tema child o plugin personalizzato, aggiungi al repository soltanto il codice del componente. Le modifiche alle pagine fatte in Bricks sono salvate nel database.

## Deploy su Hostinger

Versiona il codice personalizzato in `site/wp-content/themes/<slug>` o
`site/wp-content/plugins/<slug>` aggiungendo a `.gitignore` l'eccezione
per il singolo componente. Sviluppa in locale e pubblica i commit su GitHub.

Dopo il push, esegui dal Mac `./scripts/deploy-component.sh themes <slug>`
per vedere cosa verrebbe copiato. Aggiungi `--apply` per pubblicare il
componente. Lo script legge il commit di `origin/main` e invia via SSH
solo i file versionati del componente. I file rimossi da Git richiedono
una rimozione esplicita sul server. Attiva un nuovo tema o plugin da WordPress
quando sei pronto e verifica il sito dopo ogni deploy.
