# RubyGems Test Runner for vim-test

This is a Vim plugin that adds a test runner to
[vim-test](https://github.com/janko-m/vim-test) specifically for
[RubyGems](https://github.com/rubygems/rubygems).

This allows your cursor to be inside of a test definition, and it will figure
out the appropriate line number to run.

![nearest](https://user-images.githubusercontent.com/8496209/144134528-c483b892-57d8-4668-bdd6-7c9f3a6ff512.gif)


### Installing

Install `vim-test` and this plugin:

```viml
Plug 'vim-test/vim-test'
Plug 'aellispierce/vim-test-rubygems'
```

Add the following after the test definition from above:

```viml
let test#runners = {'Ruby': ['RubyGems']}
```

### vim-test Configuration

Vim-test supports a [number of
strategies](https://github.com/janko-m/vim-test#strategies) to asynchronously
run tests from Vim. I like [tslime](https://github.com/jgdavey/tslime.vim) to
send commands from vim to tmux. To use it
you can set the following in your `~/.vimrc`:

```viml
let test#strategy = "tslime"
```

I'd also recommend making it easy to run vim-test from a key sequence:

```viml
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>f :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>L :TestVisit<CR>
```
