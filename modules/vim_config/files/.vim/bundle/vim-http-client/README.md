# vim-http-client

Make HTTP requests from Vim with the HTTP format you already know, rather than wrestling with `curl -X POST -b cookie=$1 -F csrf_token=$2 -F "request={\"user_id\":123}" http://example.org`! Then parse the results right in Vim, syntax highlighted the way you expect!

![Demo](https://raw.githubusercontent.com/aquach/vim-http-client/master/examples/demo.gif)

See `examples/examples.txt` for other examples.

## Installation

vim-http-client requires Vim compiled with python support and the [python `requests` library](http://docs.python-requests.org/en/latest/).

You likely have Python support, but you can check with `vim --version | grep +python`. MacVim comes with Python support.

To check if you have the `requests` library, try `python -c 'import requests'`. If you get an error, try `pip install requests` to get the library. Many distros ship Python support with Vim and the `requests` library with Python.

Once you have these, use your favorite Vim plugin manager to install `aquach/vim-http-client`, or copy `plugin` and `doc` into your `.vim` folder.

## Usage

Put your cursor anywhere in a newline-delimited block of text and hit `<Leader>tt`. `vim-http-client` will parse the text into a HTTP request, execute it, and display its results will appear in a split. You can also directly invoke the HTTP client with `:call HTTPClientDoRequest()<cr>`. The format mirrors HTTP's format:

```
# Comments start with #.
# First request.
<method> <url>
<header-name-1>: <header-value-1>
<header-name-2>: <header-value-2>
...
<header-name-n>: <header-value-n>
<body>

# Second request.
<method> <url>
<header-name-1>: <header-value-1>
<header-name-2>: <header-value-2>
...
<header-name-n>: <header-value-n>
<body>
```

Depending on where you put your cursor, the first or second request will execute. You can also substitute variables anywhere in the request:

```
# Second request.
# :foo = bar
POST http://httpbin.org/post
{
  "data": ":foo",
  "otherkey": "hello"
}
```

Each variable lives in a separate commented line and always starts with a colon. Variables are substituted with simple string substitution.

If you'd like to pass form-encoded data, set your body like this:

```
<key-1>=<value-1>
<key-2>=<value-2>
...
<key-n>=<value-n>
```

See `examples/examples.txt` for more examples.

The output appears in a new split. Based on the `Content-Type` header of the HTTP response, vim-http-client chooses a filetype for syntax highlighting. It currently supports XML, JSON, and HTML; all others will get `ft=text`.

## Configuration

#### g:http_client_bind_hotkey (default 1)

Controls whether or not `<Leader>tt` will run the HTTP client. Regardless of the setting, vim-http-client will not overwrite your existing `<Leader>tt` mapping if it exists.

## Contributing

This plugin is currently quite simple. Contributions, suggestions, and feedback are all welcomed!
