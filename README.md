![Classification of Standard Industry](http://i.imgur.com/x1FGZDQ.png)

The North American Industry Classification System (NAICS) is used by business and government to classify business establishments according to type of economic activity (process of production) in Canada, Mexico and the United States. It has largely replaced the older Standard Industrial Classification (SIC) system; however, certain government departments and agencies, such as the U.S. Securities and Exchange Commission (SEC), still use the SIC codes. CSI helps you look those codes up.

# Installation

This is a Ruby gem, so you'll need a little Ruby-fu to get it working. If you're not familiar with Ruby, there are CSV copies of the data sets available too that you can load into a spreadsheet, database or parse in your favorite programming language.

#### For Rubyists:

```
gem install csi
```

Or add this to your `Gemfile`:

```
gem 'csi', '~> 0.1.0'
```

#### For everyone else:

* SIC codes in [CSV](lib/data/sic/sic-lookup.csv)
* NAICS codes in [CSV](lib/data/naics/naics-lookup.csv)

# Usage

There's built-in support for 2-6 digits NAICS codes and 2-4 digit SIC codes, so you can look them up like this:

```ruby

naics_record = CSI::naics "928110"
# => <CSI::Record:0x007fb3c5fdbb98]

naics_record.name
# => "National Security"

naics_record.correlations
# => "["9711"]" # correlating SIC codes

CSI::sic naics_record.correlations.first
# => <CSI::Record:0x007fd0bd9a4fd0>

CSI::naics("336992").name
# => Military Armored Vehicle, Tank, and Tank Component Manufacturing

CSI::naics("611310").name
# => Colleges, Universities, and Professional Schools

CSI::lookup_sic 8211
# => Elementary and Secondary Schools
```

**Pleaes note:** If you *ever* cast the String codes to Integers, you're gonna have a bad time. SIC code 011 is `011` as a String and `11` as an Integer. The more you know :dizzy:

### NAICS & SIC Overview

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

NAICS is a system that assigns a two-digit numerical code to each industry and 3 to 6 digits to each industry sub-sector.  The larger the number, the more specific the industry. For example:

```
48-49   Transportation & Warehousing (over arching industry and sub-sectors)
481     Air transportation
4812    Nonscheduled air transportation
48121   Nonscheduled air transportation
481212  Nonscheduled chartered freight air transportation
```

## Data Sources

All codes and classifications obtained via http://www.census.gov, so you know it's legit :metal:

## Copyright

Copyright (c) 2013 Lee Reilly. See LICENSE.md for further details.