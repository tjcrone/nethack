#!/bin/bash

# get items from clipboard function
get_clipboard () {
  pbpaste | grep -A1000 ${1} | gtail -n +2 | \
    grep -m 1 -B1000 'Amulets\|Weapons\|Armor\|Comestibles\|Scrolls\|Spellbooks\|Potions\|Rings\|Wands\|Tools\|Gems\|(end)' | \
    ghead -n -1 | awk -F' - ' '{print $(NF)}'
}

# get items from items.txt
get_items () {
  cat "items.txt" | grep -A1000 ${1} | gtail -n +2 | \
    grep -m 1 -B1000 'Amulets\|Weapons\|Armor\|Comestibles\|Scrolls\|Spellbooks\|Potions\|Rings\|Wands\|Tools\|Gems\|(end)' | \
    ghead -n -2
}

# declare list of items
declare -a StringArray=("Amulets" "Weapons" "Armor" "Comestibles" "Scrolls" "Spellbooks" "Potions" "Rings" "Wands" "Tools" "Gems")
 
# show items in clipboard
for item in "${StringArray[@]}"; do
  echo ${item}
  get_clipboard ${item}
done

# ask to continue
read -p "Save items? (y/n) " CONT
if [ "$CONT" = "y" ]; then
  echo "Saving ...";
else
  echo "Exiting";
  exit
fi

# create tmpfile
tmpfile=$(mktemp items.XXXXXX)

# collect items from clipboard and combine with items from file
for item in "${StringArray[@]}"; do
  echo ${item} >> ${tmpfile}
  { get_items ${item} & get_clipboard ${item}; } | sort | uniq >> ${tmpfile}
  echo "" >> ${tmpfile}
done
echo "(end)" >> ${tmpfile}

# move tmpfile to items.txt
mv ${tmpfile} "items.txt"
