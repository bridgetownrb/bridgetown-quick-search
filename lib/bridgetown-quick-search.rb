# frozen_string_literal: true

require "bridgetown"
require "bridgetown-quick-search/version"

Bridgetown.initializer :"bridgetown-quick-search" do |config|
  config.source_manifest(
    origin: Bridgetown::QuickSearch,
    components: File.expand_path("../components", __dir__),
    content: File.expand_path("../content", __dir__)
  )
end
