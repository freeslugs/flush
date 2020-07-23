# flush
🧟‍♂️ Kill zombie servers

Dead Rails servers keep taking up your ports? Get rid of the lingering servers in style. 
Also works for killing broken local postgres instances. 

## install

```
brew tap freeslugs/homebrew-tap
brew install flush
```

## how to use

### Kill zombie rails servers 

From within a Rails dir
```bash
$ rails s 
A server is already running ...
$ flush
Removed server with PID 14352.
$ rails s 
...
* Listening on tcp://localhost:3000
Use Ctrl-C to stop
```

### Kill zombie postgres  

```bash
$  psql
psql: error: could not connect to server: could not connect to server: No such file or directory
	Is the server running locally and accepting
	connections on Unix domain socket "/tmp/.s.PGSQL.5432"?
$ flush pg
Removing zombie postgres.
Restarting postgres.
$ psql
psql (12.3)
Type "help" for help.

gilad=# 
```
