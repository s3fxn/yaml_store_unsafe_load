# yaml_store_unsafe_load

yaml_store_unsafe_load - patch to use unsafe_load instead of safe_load in yaml/store

I created this to fix my app that uses yaml/store, which was broken in ruby 3.4.  It replaces a safe method with an unsafe one, so you need to fully understand what you are doing before using it.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add yaml_store_unsafe_load
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install yaml_store_unsafe_load
```

## Usage

```
#!/usr/bin/env ruby
require 'yaml/store'
require 'yaml_store_unsafe_load'

store = YAML::Store.new "test.store"
store.transaction do
  store["now"] = Time.now
end

store.transaction do
  p store["now"]      # this gem prevent here from raising an exception in ruby3.4 (yaml 0.4.0)
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/s3fxn/yaml_store_unsafe_load.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

