![Classification of Standard Industry](http://i.imgur.com/x1FGZDQ.png)

The North American Industry Classification System (NAICS) is used by business and government to classify business establishments according to type of economic activity (process of production) in Canada, Mexico and the United States. It has largely replaced the older Standard Industrial Classification (SIC) system; however, certain government departments and agencies, such as the U.S. Securities and Exchange Commission (SEC), still use the SIC codes. CSI helps you look those codes up.

# Installation

```
gem install csi
```

Or add this to your `Gemfile`:

```
gem 'csi', '~> 0.1.0'
```

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

# NAICS vs SIC

<table>
  <tbody>
    <tr>
      <th colspan="2">NAICS</td>
      <th colspan="2">SIC</td>
    </tr>
    <tr>
      <td>2-digit</td>
      <td>Sector</td>
      <td>Division</td>
      <td>Letter</td>
    </tr>
    <tr>
      <td>3-digit</td>
      <td>Subsector</td>
      <td>Major Group</td>
      <td>2-digit</td>
    </tr>
    <tr>
      <td>4-digit</td>
      <td>Industry Group</td>
      <td>Industry Group</td>
      <td>3-digit</td>
    </tr>
    <tr>
      <td>5-digit</td>
      <td>NAICS Industry</td>
      <td>Industry</td>
      <td>4-digit</td>
    </tr>
    <tr>
      <td>6-digit</td>
      <td>National</td>
      <td>N/A</td>
      <td>N/A</td>
    </tr>
  </tbody>
</table>

NAICS is a system that assigns a two-digit numerical code to each industry and 3 to 6 digits to each industry sub-sector.  The larger the number, the more specific the industry. For example:

```
48-49   Transportation & Warehousing (over arching industry and sub-sectors)
481     Air transportation
4812    Nonscheduled air transportation
48121   Nonscheduled air transportation
481212  Nonscheduled chartered freight air transportation
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