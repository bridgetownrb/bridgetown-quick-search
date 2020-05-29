# frozen_string_literal: true

require "bridgetown"
require "bridgetown-quick-search/builder"

Bridgetown::PluginManager.new_source_manifest(
  origin: Bridgetown::QuickSearch,
  components: File.expand_path("../components", __dir__),
  content: File.expand_path("../content", __dir__)
)
