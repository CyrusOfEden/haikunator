Haikunator [![Build Status](https://travis-ci.org/knrz/Haikunator.svg?branch=master)](https://travis-ci.org/knrz/Haikunator) [![Inline docs](http://inch-ci.org/github/knrz/Haikunator.svg?branch=master)](http://inch-ci.org/github/knrz/Haikunator)
==========

Generate Heroku-like memorable random names to use in your apps or anywhere else.

Installation
------------

Add Haikunator to your `mix.exs` dependencies:

```elixir
defp deps do
  [{:haikunator, "~> 1.0.0"}]
end
```

Then run `$ mix deps.get`. And also `$ mix deps.compile`, for kicks.

Usage
-----

```elixir
Haikunator.build # => "morning-star-6817"

# Token range
Haikunator.build(100) # => "summer-dawn-24"

# Don't include the token
Haikunator.build(0) # => "ancient-frost"

# Use a different delimiter
Haikunator.build(9999, ".") # => "frosty.leaf.8347"

# No token, no delimiter
Haikunator.build(0, "") # => "twilightbreeze"
```

License
-------

Copyright (c) 2015 Kash Nouroozi

This work is free. You can redistribute it and/or modify it under the terms of the MIT License. See the LICENSE file for more details.

Other Languages
---------------

Haikunator is available in other languages. Check them out:

* Ruby: https://github.com/usmanbashir/haikunator
* Node: https://github.com/AtroxDev/haikunatorjs
* Python: https://github.com/AtroxDev/haikunator
* Go: https://github.com/yelinaung/go-haikunator
