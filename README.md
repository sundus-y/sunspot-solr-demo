# sunspot-solr-demo
Demo to sunspot solr

# Setup
```ruby
bundle install
```
```ruby
rake db:migrate
```
```ruby
rake sunspot:solr:start
```
```ruby
rails s
```
Once you have the server running to get some random articles generated go to

[http://localhost:3000/articles/generate/2/](http://localhost:3000/articles/generate/2/)
where 2 is the number of articles you want to generate

# Other Important commands
```ruby
rake sunspot:solr:stop
```
```ruby
rake sunspot:solr:restart
```
```ruby
rake sunspot:reindex
```

# Links for more info
[Sunspot github](https://github.com/sunspot/sunspot) <br>
[API Reference](http://sunspot.github.com/sunspot/docs/) <br>
[solr doc](https://wiki.apache.org/solr/) <br>
[railscasts](http://railscasts.com/episodes/278-search-with-sunspot) <br>

<i>For the random article generator I am using [SCIgen - An Automatic CS Paper Generator](http://pdos.csail.mit.edu/scigen/)</i>

