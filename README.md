# stadtlandfluss
[![StadtlandFluss](http://fs2.directupload.net/images/150227/mdjvbl4j.png)](http://stadtlandflussduell.herokuapp.com)

**Installationshinweise:**

**Benötigte Gems:**

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
Nun den Befehl ``` bundle install ``` ausführen.

Zum erstellen der Datenbanktabellen ``` rake db:schema:load ``` ausführen.

**Dann folgende Befehle ausführen, damit die akzeptierten Lösungen in die Lösungstabellen für Stadt, Land und Fluss eingetragen werden:**

```sh
rake db:data:load  
```

**User-Storys:**
+ User kann sich registrieren
+ User kann sich einloggen
+ User kann seine Userdaten editieren
+ User kann ein neues Spiel erstellen
+ User kann einem offenenen Spiel beitreten
+ User kann ein offenes Spiel löschen
+ User kann spielen bzw. seine Lösungen in den Spielbogen eintragen





