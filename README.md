# A Flamboyant Mock User Generator

Sometimes, when designing and/or building an application interface, it helps to have mock user data. This application provides an API over HTTP to request mock or placeholder user data including:

+ User Names
+ User IDs (as MD5 Digests)
+ User Avatars
+ User Meta-Data

All of the user data, including the imagery, comes from the [Key & Peele *East/West College Bowl*](http://www.youtube.com/watch?v=gODZzSOelss) and [Key & Peele *East/West College Bowl 2*](www.youtube.com/watch?v=rT1nGjGM2p8) sketches from Comedy Central.

<iframe width="560" height="315" src="//www.youtube.com/embed/gODZzSOelss" frameborder="0" allowfullscreen></iframe>
<iframe width="560" height="315" src="//www.youtube.com/embed/rT1nGjGM2p8" frameborder="0" allowfullscreen></iframe>

## The endpoints

Users are represented as "players", and are of the [JSON](http://json.org/) form:

    {
      "name"     : "X-Wing @Aliciousness",
      "college"  : "Missouri Western State University",
      "id"       : "faa5956c57cb81618f68b59a1862e888",
      "image"    : full_path_to_user_avatar
    }

All images are 512x512 PNG.

### Getting all the players

The players are divided evenly into two squads: East and West, and can be requested by squad. There are a total of 32 players.

    GET /players

This will return an array in json of all the "players".

    GET /east

This will return an array of only those players in the East.

    GET /west

This will return an array of only those players in the West.

### Getting a subset of players

Each of these endpoints will by default, return one an array of one random player. Each endpoint takes an optional query parameter `n` which takes a number of players to return. The players will always be shuffled. No matter what value you give to `n`, you will only get the max number of players in each squad.

    GET /player

Return `n` or 1 random player.

    GET /east/player

Return `n` or 1 random player from the East.

    GET /west/player

Return `n` or 1 random player from the West.

### Getting a single player

    GET /:id

Where `:id` is the id of a particular player.

### Getting only avatars

In addition to the image paths provided for each player, you can request a random player avatar.

    GET /avatar.png

    GET /east/avatar.png

    GET /west/avatar.png

## Why?

I find the Key & Peele sketch very funny.

## What?

The API is written with [Sinatra](http://www.sinatrarb.com/) and hosted on [Heroku](https://www.heroku.com/).

The player formerly known as Mousecop's symbol is [`U+2A17`](http://codepoints.net/U+2A17).

Check out [AvatarPro.biz](http://www.avatarpro.biz/) for more potential user profile imagery.

## Who?

I am [Mark Wunsch](http://markwunsch.com/). I wrote this application.

[Key & Peele](http://www.comedycentral.com/shows/key-and-peele) are Keegan-Michael Key and Jordan Peele and they made these characters.

