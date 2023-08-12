# Nethack Notes and Files
These are my notes and files from my painful Nethack life. The way life was meant to be.

## Installation
Currently I play Nethack locally on my M1 Mac, and compile from scratch using a modified Homebrew formula file located in this repo. The only modification I currently make is to enable dumplogs:
```zsh
brew install --build-from-source --formula nethack.rb
```
## sort_items.sh
`sort_items.sh` is a shell script that I used to use for building my items.txt file, pulling from text copied during inventory identification after YASD. Since enabling dumplogs I no longer use this script.

## notes.md
`notes.md` is where I keep my gameplay notes. I'm mostly trying to figure out how to win Nethack on my own, trying to limit the spoilers I take in. But I'm not militant about it and will poke around on the [wiki](https://nethackwiki.com/wiki/) from time to time. I'm of the opinion that it is basically impossible to win Nethack with zero spoilers. Other even more insane people [think the same thing](https://www.reddit.com/r/nethack/comments/ydv2fx/24_years_spoiler_free_one_persons_best_attempt_at/). The [Nethack Guidebook](https://www.nethack.org/v367/Guidebook.html) has tons of really helpful information and is not considered a spoiler.

## items.txt
`items.txt` is an old list of all the items I picked up over the first year or so of playing. Now that I have the dumplogs enabled, I won't be updating this file but I will probably write some Python code to analyze the logs in some meaningful way.
