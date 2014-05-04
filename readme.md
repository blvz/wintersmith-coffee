# wintersmith-livescript

[LiveScript](http://livescript.net/) plugin for [wintersmith](https://github.com/jnordberg/wintersmith).

### install:

`npm install wintersmith-livescript`

then add `./node_modules/wintersmith-livescript/` to `config.json` like:

    {
      "locals": {
        "url": "http://localhost:8080",
        "name": "The Wintersmith's blog",
        "owner": "The Wintersmith",
        "description": "-32°C ain't no problems!",
        "index_articles": 3
      },
      "plugins": [
        "./node_modules/wintersmith-livescript/"
      ]
    }
