Storykit Lua Test
=====

Assignment:
* Use the variable lang_id to find the corresponding sentences within the table "input".
* Create a keyed table named output with the keys from the input table and where the content of each key
has the correct string stored as [value] and the id as [text_id].

Example:

        local lang_id = "lorem"
    
        local output = {
            greeting = {
                value = "Lorem ipsum!",
                text_id = 1
            },
            headline = {
                value = "Dolor sit amet.",
                text_id = 2
            },
            content = {
                value = "Quisque at luctus libero. Lorem ipsum dolor sit amet.",
                text_id = 3
            },
            footer = {
                value = "Donec iaculis facilisis: Jan 1 1970.",
                text_id = 4
            }
        }

* Create an array table where the strings are stored and ordered by text_id from lowest to highest id.

Example:

        local ordered_by_id = {
            "Lorem ipsum!",
            "Dolor sit amet.",
            "Quisque at luctus libero. Lorem ipsum dolor sit amet.",
            "Donec iaculis facilisis: Jan 1 1970."
        }

* Create an array table where the strings are stored and sorted from fewest characters to most characters.
  
Example:

        local sorted_by_length = {
            "Lorem ipsum!",
            "Dolor sit amet.",
            "Donec iaculis facilisis: Jan 1 1970.",
            "Quisque at luctus libero. Lorem ipsum dolor sit amet."
        }

Optional tasks:
* Pick the languange "lorem" if lang_id is missing or language doesn't exist.
* If the text is longer than 20 characters, create a key in output[text] called "shortened_text" and set the value to the first 17 characters of the text and with "..." at the end. Eg: "Donec iaculis fac..."
