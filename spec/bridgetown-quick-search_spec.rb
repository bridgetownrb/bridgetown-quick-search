# frozen_string_literal: true

require "spec_helper"

# I am not sure why this is necessary, but it is the only way that the
# initializer is actuall still run on every example, if the config is left in
# the `let` then the initializer is only run on the first example
module TestValues
  class << self
    attr_accessor :config
  end
end


describe(Bridgetown::QuickSearch) do
  let(:config) do
    TestValues::config ||= Bridgetown.configuration(Bridgetown::Utils.deep_merge_hashes({
      "full_rebuild" => true,
      "root_dir"     => root_dir,
      "source"       => source_dir,
      "destination"  => dest_dir,
    }, overrides)).tap do |conf|
      conf.run_initializers! context: :static
    end
  end

  describe "plugin behavior" do
    let(:overrides) { {} }
    let(:metadata_overrides) { {} }
    let(:metadata_defaults) do
      {
        "name" => "My Awesome Site",
        "author" => {
          "name" => "Ada Lovejoy",
        }
      }
    end

    let(:site) { Bridgetown::Site.new(config) }
    let(:contents) { File.read(dest_dir("index.html")) }
    let(:index_json) { Pathname.new(dest_dir("bridgetown_quick_search/index.json")) }

    def parsed_index(index: index_json)
      JSON.parse(index.read)
    end

    before(:each) do
      metadata = metadata_defaults.merge(metadata_overrides).to_yaml.sub("---\n", "")
      File.write(source_dir("_data/site_metadata.yml"), metadata)
      site.process
      FileUtils.rm(source_dir("_data/site_metadata.yml"))
    end

    context "based upon page contents" do
      it "creates the index.html file" do
        expect(contents).to match 'Testing this plugin'
      end

      it "creates the index.json file" do
        expect(index_json).to exist
      end

      it "has the content from the index.html file in the index" do
        root_entry = parsed_index.find { |entry| entry["url"] == "/" }
        expect(root_entry).not_to be_nil
        expect(root_entry["content"]).to match(/Testing this plugin/)
      end

      it "does not include its own template in the output" do
        index_entry  = parsed_index.find { |entry| entry["url"] == "/bridgetown_quick_search/index.json" }
        expect(index_entry).to be_nil
      end

      it "does not include excluded content" do
        excluded_entry = parsed_index.find { |entry| entry["url"] == "/excluded/" }
        expect(excluded_entry).to be_nil
      end
    end

    context "based upon quick_search_terms" do
      let(:terms_entry) {
        parsed_index.find { |entry| entry["url"] == "/terms/" }
      }

      it "creates the index.json file" do
        expect(index_json).to exist
      end

      it "includes contente from quick_search_terms" do
        expect(terms_entry["content"]).to match(/quick terms/)
      end

      it "does not include content from quick_search_terms body" do
        expect(terms_entry["content"]).not_to match(/NOT IN SEARCH/)
      end
    end
  end
end
