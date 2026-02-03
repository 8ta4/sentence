# sentence

## Make Sentence Make Sense

`sentence` is sentence motions and text objects built for prose.

## Setup

> How do I set up `sentence`?

1. Make sure you're using [`lazy.nvim`](https://github.com/folke/lazy.nvim).

1. Add this block to your `lazy.nvim` configuration:

    ```lua
    {
      "8ta4/sentence",
    }
    ```

## Usage

> Will the `)` motion stop on blank lines?

No. The `)` motion bypasses blank lines. This keeps you moving between thoughts, instead of landing on dead space.

> From Normal mode, will `vis` select anything if the cursor is on a blank line?

Yes. Instead of selecting nothing on a blank line, `vis` selects the next sentence, if one exists.

> From Normal mode, with the cursor on a sentence, does `vas` select its trailing spaces?

Yes. `as` selects the trailing spaces, so operations like `das` don't leave your text messy. `is` selects only the sentence text. This gives `is` and `as` distinct purposes, so you're not wasting keys on redundant behavior.

> Does `sentence` treat the period in `Mr.` as the end of a sentence when the period isn't the last non-whitespace character on its line?

No. The plugin doesn't treat the period in unambiguous abbreviations like `Mr.`, `Dr.`, `Mrs.`, and `Ms.` as a sentence terminator if the period isn't the last non-whitespace character on its line. This stops the plugin from splitting what is linguistically a single sentence. It avoids rules for ambiguous cases like `Jr.` because such rules could make the plugin treat two separate linguistic sentences as one. This keeps the rules simple.

> Does `sentence` treat a question mark as the end of a sentence when a space follows the question mark?

Yes. The same thing goes for exclamation marks. This matches the general handling of periods, except that periods in unambiguous abbreviations like `Mr.`, `Dr.`, `Mrs.`, and `Ms.` aren't treated as terminators if they aren't the last non-whitespace character on the line.

