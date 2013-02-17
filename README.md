![Classification of Standard Industry](http://i.imgur.com/x1FGZDQ.png)

The North American Industry Classification System (NAICS) is used by business and government to classify business establishments according to type of economic activity (process of production) in Canada, Mexico and the United States. It has largely replaced the older Standard Industrial Classification (SIC) system; however, certain government departments and agencies, such as the U.S. Securities and Exchange Commission (SEC), still use the SIC codes. CSI helps you look those codes up.

# Installation

`gem install rails`

Or add this to your `Gemfile`:

`gem 'csi', '~> 0.1.0'  `

# Usage

```ruby
CSI::lookup_naics 336992
# => Military Armored Vehicle, Tank, and Tank Component Manufacturing

CSI::lookup_naics 611310
# => Colleges, Universities, and Professional Schools

CSI::lookup_naics 62
# => Health Care and Social Assistance

CSI::lookup_sic 6021
# => National Commercial Banks
```

# Contributing

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

# Copyright

Copyright (c) 2013 Lee Reilly. See LICENSE.txt for further details.