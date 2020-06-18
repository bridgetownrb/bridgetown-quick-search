# Bridgetown Quick Search plugin

_Requires Bridgetown v0.15 or greater_

This [Bridgetown](https://www.bridgetownrb.com) plugin provides a component you can add to your site (likely the top navbar) to allow fast, real-time search of your posts, pages, and other collection documents. It automatically generates a JSON index file which gets built along with the rest of the site, and then the component consumes that file and uses [Lunr.js](https://lunrjs.com) to construct the live search index and provide the search results as you type.

----

## Installation

Run this command to add this plugin to your site's Gemfile:

```shell
$ bundle add bridgetown-quick-search -g bridgetown_plugins
```

Next, add this line to the top of your frontend's Javascript index file:

```js
// frontend/javascript/index.js

import "bridgetown-quick-search"
```

Then add the Liquid component to one of your site templates, for example `src/_components/navbar.liquid`:

```html
{% render "bridgetown-quick-search/search" %}
```

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
