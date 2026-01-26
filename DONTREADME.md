## Goals

### Bypassing

> Will the `)` motion stop on blank lines?

No. The `)` motion bypasses blank lines. This keeps you moving between thoughts, instead of landing on dead space.

### Utility

> From Normal mode, will `vis` select anything if the cursor is on a blank line?

Yes. Instead of selecting nothing on a blank line, `vis` selects the next sentence, if one exists.

### Distinction

> From Normal mode, with the cursor on a sentence, does `vas` select its trailing spaces?

Yes. `as` selects the trailing spaces, so operations like `das` don't leave your text messy. `is` selects only the sentence text. This gives `is` and `as` distinct purposes, so you're not wasting keys on redundant behavior.

### Conservatism

> Does `sentence` treat `Mr.` as the end of a sentence?

No. `sentence` has rules to ignore the period in unambiguous abbreviations like `Mr.`, `Dr.`, `Mrs.`, and `Ms.`. This stops the plugin from splitting what is linguistically a single sentence. It avoids rules for ambiguous cases like `Jr.` because such rules could make the plugin treat two separate linguistic sentences as one. This keeps the rules simple.

### Latency

> What's the latency target?

The goal is under 0.1 seconds.

0.1 second is about the limit for having the user feel that the system is reacting instantaneously.

### Extensibility

> When the cursor is on a sentence, can I programmatically get the sentence's start position?

Yes. The Lua function `sentence.get()` gives you the start and end coordinates of a sentence. You pass it an integer offset to get any sentence relative to the cursor, like the previous, current, or next one. It's built to be a foundation for other plugins.
