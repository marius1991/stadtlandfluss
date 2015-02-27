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

**Nach dem herunterladen des Repositorys folgende Befehle anwenden:**

```sh
rake db:schema:load
rake db:data:load  
```
Damit die akzeptierten Lösungen in die Lösungstabellen für Stadt, Land und Fluss eingetragen werden
