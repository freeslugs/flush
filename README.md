# flush
🧟‍♂️ Kill zombie servers

Dead Rails servers keep taking up your ports? Get rid of the lingering servers in style. 

## install

`brew tap freeslugs/homebrew-tap`
`brew install flush`

## how to use

From within a Rails dir
```bash
$ rails s 
A server is already running ...
$ flush
Removed server on port 3000.
$ rails s 
...
* Listening on tcp://localhost:3000
Use Ctrl-C to stop
```
