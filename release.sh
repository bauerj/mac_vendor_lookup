#!/bin/sh

set -ex

cd "$(dirname "$0")"

python3 -m pip install --user -e .
python3 -c "from mac_vendor_lookup import MacLookup; MacLookup().update_vendors()"
cp ~/.cache/mac-vendors.txt .
python3 setup.py bdist_wheel