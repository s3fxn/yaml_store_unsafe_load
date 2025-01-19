# frozen_string_literal: false

require_relative "yaml_store_unsafe_load/version"

module YamlStoreUnsafeLoad
  def load(content)
    table =  if YAML.respond_to?(:safe_load)
      if Psych::VERSION >= "3.1"
        YAML.unsafe_load(content) # instead of YAML.safe_load(content, permitted_classes: [Symbol])
      else
        YAML.unsafe_load(content) # instead of YAML.safe_load(content, [Symbol])
      end
    else
      YAML.load(content)
    end
    if table == false || table == nil
      {}
    else
      table
    end
  end
end

class YAML::Store
  prepend YamlStoreUnsafeLoad
end if defined?(YAML::Store)
