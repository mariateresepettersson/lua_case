-- Each key (e.g., greeting, headline) maps to a table.
-- This table contains translations of a piece of text in different languages and a unique text_id.
local input = {
    greeting = {
        eng = "Hello World!",
        swe = "Hallå Världen!",
        ger = "Hallo Welt!",
        lorem = "Lorem ipsum!",
        text_id = 1
    },
    headline = {
        eng = "This is a headline.",
        swe = "Det här en rubrik.",
        ger = "Dies ist eine Überschrift.",
        lorem = "Dolor sit amet.",
        text_id = 2
    },
    content = {
        eng = "This is the main content. It consists of two sentences.",
        swe = "Det här är huvudinnehållet. Det består av två meningar.",
        ger = "Dies ist der Hauptinhalt. Er besteht aus zwei Sätzen.",
        lorem = "Quisque at luctus libero. Lorem ipsum dolor sit amet.",
        text_id = 3
    },
    footer = {
        eng = "Last updated: February 15 2024.",
        swe = "Senast uppdaterad: 15 februari 2024.",
        ger = "Zuletzt aktualisiert: 15. Februar 2024.",
        lorem = "Donec iaculis facilisis: Jan 1 1970.",
        text_id = 4
    }
}

-- define language
local lang_id = "swe"

-- create a table called "output" to store the restructured data
local output = {}

-- create an array table called "ordered_by_id" to sort the text by id
local ordered_by_id = {}

-- create an array table called "sorted_by_length" to sort the text by length
local sorted_by_length = {}

-- Processing the 'input' data
for key, val in pairs(input) do               -- loop through input
    local text = val[lang_id] or val["lorem"] -- if the selected language is not available, default to lorem
    output[key] = {                           -- populating the output table, each key in input is mirrored in output storing the selected text and text_id.
        value = text,
        text_id = val.text_id
    }
    if #text > 20 then
        -- If longer than 20 characters a shortened version is stored.
        output[key].shortened_text = string.sub(text, 1, 17) ..
            "..." -- 1-17 characters + 3 = 20 in total to be displayed
    end
    -- For sorting by text_id
    table.insert(ordered_by_id, { text = text, id = val.text_id })
    -- For sorting by length
    table.insert(sorted_by_length, text)
end

-- Sorting 'ordered_by_id' by 'id'
table.sort(ordered_by_id, function(a, b)
    return a.id < b.id
end)
-- Extracting sorted texts based on 'text_id'
local temp_ordered_by_id = {}
for _, item in ipairs(ordered_by_id) do
    table.insert(temp_ordered_by_id, item.text)
end
ordered_by_id = temp_ordered_by_id -- Now 'ordered_by_id' contains texts sorted by 'text_id'

-- Sorting 'sorted_by_length' by length of the text
table.sort(sorted_by_length, function(a, b)
    return #a < #b
end)

-- Print the tables:
-- Iterate over the sorted list to print the output table's contents in order
-- Step 1: Extract keys and their corresponding text_ids after processing input
local keys_sorted_by_id = {}
for key, value in pairs(output) do
    table.insert(keys_sorted_by_id, { key = key, text_id = value.text_id })
end

-- Step 2: Sort this list by text_id
table.sort(keys_sorted_by_id, function(a, b)
    return a.text_id < b.text_id
end)

-- Printing the output in order of text_id
print("Output")
for _, entry in ipairs(keys_sorted_by_id) do
    local key = entry.key
    local value = output[key]
    print(key .. ": {")
    print("  value = " .. tostring(value.value))
    print("  text_id = " .. tostring(value.text_id))
    if value.shortened_text then
        print("  shortened_text = " .. tostring(value.shortened_text))
    end
    print("}")
end

print("\nOrdered by ID:")
for i, text in ipairs(ordered_by_id) do print(i, text) end

print("\nSorted by Length:")
for i, text in ipairs(sorted_by_length) do print(i, text) end
