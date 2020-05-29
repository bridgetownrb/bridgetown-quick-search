# frozen_string_literal: true

module Bridgetown
  module QuickSearch
    class Builder < Bridgetown::Builder
      def build
        #liquid_tag "sample_plugin" do
        #  "This plugin works!"
        #end
      end
    end
  end
end

Bridgetown::QuickSearch::Builder.register
