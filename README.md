# Bridgetown Quick Search plugin

This [Bridgetown](https://www.bridgetownrb.com) plugin provides a component you can add to your site (likely the top navbar) to allow fast, real-time search of your posts, pages, and other collection documents. It automatically generates a JSON index file which gets built along with the rest of the site, and then the component consumes that file and uses [Lunr.js](https://lunrjs.com) to construct the live search index and provide the search results as you type.

----

## Installation for Bridgetown 1.2+

Run this command to add this plugin to your site's Gemfile:

```shell
$ bundle add bridgetown-quick-search
```

And then add the initializer to your configuration in `config/initializers.rb`:

```ruby
init :"bridgetown-quick-search"
```

Next, add this line to the top of your frontend's Javascript index file:

```js
// frontend/javascript/index.js

import "bridgetown-quick-search"
```

Then add the Liquid component to one of your site templates, for example `src/_components/navbar.liquid`:

```html
{% render "bridgetown_quick_search/search" %}
```

If you're using a Ruby-based template (ERB, etc.), you can use the `liquid_render` helper:

```html
<%= liquid_render "bridgetown_quick_search/search" %>
```

## Component Options

You can provide additional Liquid variables to the component to configure its appearance. These are:

* `placeholder`: Text that will appear in the input control when no search value is present
* `input_class`: Add custom CSS class names to the input control
* `theme`: The component's default theme is a "light" appearance, but you can also set it to use a "dark" appearance
* `snippet_length`: The length of the text snippet for each search result. Defaults to 142.
* `display_collection`: Will show collections to which belong search results if true. Defaults to false.

Here's an example of using all variables at once:

```html
{% render "bridgetown_quick_search/search", placeholder: "Search", input_class: "input", theme: "dark", snippet_length: 200, display_collection: true %}
```

## Styling

You can use CSS variables to control aspects of the search results popup. The popup is rendered inside of a Web Component using Shadow DOM, so these variables are the primary method of altering its appearance. The available variables are `link-color`, `divider-color`, `text-color`, `border-radius` and `border-corner-radius`.

```css
bridgetown-search-results {
  --link-color: #0f5348;
  --divider-color: #e6e1d7;
  --text-color: #3e3f3a;
}
```

You can also alter the outer popup container via the custom element directly, as well as the wrapper surrounding the results contents using CSS Shadow Parts:

```css
bridgetown-search-results {
/* Adjust the outer container of the popup */
}

bridgetown-search-results::part(inner) {
/* Adjust the popup contents wrapper */
}

bridgetown-search-results::part(inner-link) {
/* Adjust the link style of each search result */
}
```

## Controlling the Search Index

You can provide additional front matter variables to any page or document to control the search index. These are:

* `exclude_from_search: true`: Setting this will exclude that item from the search index JSON. To batch-exclude pages, collections, categories, etc., you could use front matter defaults to set the `exclude_from_search` variable.
* `quick_search_content: "content for the index"`: Setting this will override the content in the search index JSON. Normally the content in the search index JSON is the content of the page. Setting this front matter variable explicilty sets the content in the search index JSON.

## Testing

* Run `bundle exec rspec` to run the test suite
* Or run `script/cibuild` to validate with Rubocop and test with rspec together.

## Contributing

1. Fork it (https://github.com/bridgetownrb/bridgetown-quick-search/fork)
2. Clone the fork using `git clone` to your local development machine.
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
