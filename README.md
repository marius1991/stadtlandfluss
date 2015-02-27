# stadtlandfluss
[![StadtlandFluss](http://fs2.directupload.net/images/150227/mdjvbl4j.png)](http://stadtlandflussduell.herokuapp.com)

#Installationshinweise:

Rails Version: 4.1.6

**Verwendete Gems:**

```rb
gem 'therubyracer'
gem 'less-rails'
gem 'twitter-bootstrap-rails'
gem 'rails-gallery'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'devise-i18n'
gem 'yaml_db'
```
Nach herunterladen des Repositorys den Befehl ``` bundle install ``` ausführen.

Zum erstellen der Datenbanktabellen ``` rake db:schema:load ``` ausführen.

**Dann folgenden Befehl ausführen, damit die akzeptierten Lösungen in die Lösungstabellen für Stadt, Land und Fluss eingetragen werden:**

```sh
rake db:data:load  
```
Die akzeptierten Lösungen enthalten alle 2060 deutsche Städte, alle souveränen Staaten der Welt und ca. 400 deutsche Flüsse (Alle Daten von Wikipedia)

Nun kann man sich Registrieren und Spaß haben!

**User-Storys:**
+ User kann sich registrieren
+ User kann sich einloggen
+ User kann seine Userdaten editieren
+ User kann ein neues Spiel erstellen
+ User kann einem offenenen Spiel beitreten
+ User kann ein offenes Spiel löschen
+ User kann spielen bzw. seine Lösungen in den Spielbogen eintragen
+ User sieht die erreichte Punktzahl, seinen Spielbogen und den des Gegners unmittelbar nach dem Spiel





