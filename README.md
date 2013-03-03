![Classification of Standard Industry](http://i.imgur.com/x1FGZDQ.png)

The North American Industry Classification System (NAICS) is used by business and government to classify business establishments according to type of economic activity (process of production) in Canada, Mexico and the United States. It has largely replaced the older Standard Industrial Classification (SIC) system; however, certain government departments and agencies, such as the U.S. Securities and Exchange Commission (SEC), still use the SIC codes. CSI helps you look those codes up.

# Installation

This is a Ruby gem, so you'll need a little Ruby-fu to get it working. If you're not familiar with Ruby, there are CSV copies of the data sets available too that you can load into a spreadsheet, database or parse in your favorite programming language. There's also a TOML file with all of the codes, classifications and correlations :neckbeard:.

#### For Rubyists:

```
gem install csi
```

Or add this to your `Gemfile`:

```
gem 'csi', '~> 0.1.0'
```

#### For everyone else:

* All NAICS and SIC codes, classifications, and correlations in [TOML](lib/data/master.toml)
* NAICS codes in [CSV](lib/data/naics/naics-lookup.csv)
* SIC codes in [CSV](lib/data/sic/sic-lookup.csv)

# Usage

You can look up 2-6 digits NAICS codes and 2-4 digit SIC codes. **Pleaes note:** If you *ever* cast the String codes to Integers, you're gonna have a bad time. SIC code 011 is `011` as a String and `11` as an Integer. The more you know :dizzy:

```ruby

naics_record = CSI::naics "928110"
# => <CSI::Record:0x007fb3c5fdbb98]

naics_record.name
# => "National Security"

CSI::naics("336992").name
# => Military Armored Vehicle, Tank, and Tank Component Manufacturing

CSI::naics("611310").name
# => Colleges, Universities, and Professional Schools

CSI::sic("8211").name
# => Elementary and Secondary Schools

CSI::sic("91")
# => "Executive, Legislative, and General Government, except Finance"
```

You can also lookup correlating SIC codes for NAICS codes and vice-versa!

```ruby
naics_record = CSI::naics("928110")
# => <CSI::Record:0x007fb3c5fdbb98]

naics_record.name
# => "National Security"

naics_record.correlations
# => "["9711"]"

correlating_sic_record = CSI::sic naics_record.correlations.first
# => <CSI::Record:0x007fd0bd9a4fd0>

correlating_sic_record.name
# => "National Security"
```

### NAICS & SIC Overview

Explaining NAICS and SIC is outside the scope of this README, but you'll find an extremely brief overview below. For more information you can check out the [SIC page](http://en.wikipedia.org/wiki/Standard_Industrial_Classification) and [NAICS page](http://en.wikipedia.org/wiki/North_American_Industry_Classification_System) on Wikipeda.

<table>
   <tr>
      <th>Digit range</th>
      <th>NAICS Definition</th>
      <th>SIC Definition</th>
   </tr>
   <tr>
      <td>1 - 2</td>
      <td>Sector</td>
      <td>Major Group</td>
   </tr>
   <tr>
      <td>1 - 3</td>
      <td>Subsector</td>
      <td>Industry Group</td>
   </tr>
   <tr>
      <td>1 - 4</td>
      <td>Industry Group</td>
      <td>Industry</td>
   </tr>
   <tr>
      <td>1 -5 </td>
      <td>NAICS Industry</td>
      <td>N/A</td>
   </tr>
   <tr>
      <td>1 -6 </td>
      <td>National</td>
      <td>N/A</td>
   </tr>
</table>

The larger the coode, the more specific the industry. Here's a NAICS example:

<table>
  <tr>
    <th>Code</th>
    <th>Name</th>
  </tr>
  <tr>
    <td>48</td>
    <td>Transportation & Warehousing (over arching industry and sub-sectors)</td>
  </tr>
  <tr>
    <td>481</td>
    <td>Air transportation</td>
  </tr>
  <tr>
    <td>4812</td>
    <td>Nonscheduled air transportation</td>
  </tr>
  <tr>
    <td>48121</td>
    <td>Nonscheduled air transportation</td>
  </tr>
  <tr>
    <td>481212</td>
    <td>Nonscheduled chartered freight air transportation</td>
  </tr>
</table>

## Data Sources

All codes and classifications obtained via http://www.census.gov, so you know it's legit.

## Copyright

Copyright (c) 2013 Lee Reilly. See LICENSE.md for further details.

Many Bothans died to bring you this information.