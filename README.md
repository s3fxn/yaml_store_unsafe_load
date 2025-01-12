# yaml_store_unsafe_load

yaml_store_unsafe_load - patch to use unsafe_load instead of safe_load in yaml/store

I created this to fix my app that uses yaml/store, which was broken in ruby 3.4.  Since this replaces a safe method with an unsafe method, you need to fully understand what you are doing before using it.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG
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

