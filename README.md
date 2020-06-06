Mac Vendor Lookup
=================

This library provides an easy way to get vendor information from a MAC address. It contains a local copy of the IEEE's
OUI prefix list. It has an asynchronous interface using Python 3's asyncio as well as a regular synchronous interface
for old-school usage.

## Installation

    pip install mac-vendor-lookup

## Basic Usage

```python
from mac_vendor_lookup import MacLookup

print(MacLookup().lookup("00:80:41:12:FE"))
```

Output:

> VEB KOMBINAT ROBOTRON

## Update the vendor list

The library contains a list of MAC prefixes obtained at build-time. If you need up-to-date information, you can
download a fresh copy of the list directly from IEEE with `MacLookup.update_vendors` or `AsyncMacLookup.update_vendors`:

```python
from mac_vendor_lookup import MacLookup

mac = MacLookup()
mac.update_vendors()  # <- This can take a few seconds for the download
    
def find_mac(mac_address):
    print(mac.lookup(mac_address))

```

## Vendor list custom location or path

The library stores and looks for the list of MAC prefixes in a group predefined defaults paths. If a custom 
directory is required, then override the class variable `cache_path` of `class BaseMacLookup(...)` from it default 
location of: `os.path.expanduser('~/.cache/mac-vendors.txt')` to your prefered location.

```python
from mac_vendor_lookup import MacLookup, BaseMacLookup

BaseMacLookup.cache_path = "/relative/or/absolute/path/to/the/prefered/storage/location"
mac = MacLookup()
mac.update_vendors()  # <- This can take a few seconds for the download and it will be stored in the new path
    
def find_mac(mac_address):
    print(mac.lookup(mac_address))

```

## Async Interface

There is also an asynchronous interface available:

```python
from mac_vendor_lookup import AsyncMacLookup

async def main():
    mac = AsyncMacLookup()
    print(await mac.lookup("98:ED:5C:FF:EE:01"))
```

Output:

> Tesla Motors, Inc

## Command line interface

This library provides a rudimentary command line interface:

```bash
$ mac_vendor_lookup 50-D3-7F-00-01-00
Yu Fly Mikly Way Science and Technology Co., Ltd.
$ python3 -m mac_vendor_lookup 00:26:12:12:FE
Space Exploration Technologies
```
