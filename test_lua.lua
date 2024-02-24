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

local lang_id = "swe"

local output = {}
local ordered_by_id = {}
local sorted_by_length = {}

-- Processing the 'input' data
-- loop through the input to iterate over each key-value pair 
for key, val in pairs(input) do
    -- select language and put lorem as default for error handling
    local text = val[lang_id] or val["lorem"]
    -- shorten the text to show max 20 characters
    local shortened_text = #text > 20 and string.sub(text, 1, 17) .. "..." or nil
    -- Populating the 'output' table
    output[key] = {
        value = text,
        text_id = val.text_id,
        shortened_text = shortened_text
    }
    -- Populate 'ordered_by_id' with just the text, indexed by text_id for automatic order
    ordered_by_id[val.text_id] = text
    -- Add full text info to 'sorted_by_length' for sorting
    table.insert(sorted_by_length, text)
end

-- Sorting 'sorted_by_length' by length of the text
table.sort(sorted_by_length, function(a, b)
    return #a < #b
end)

-- Printing the output in detailed format
print("Output:")
for key, item in pairs(output) do
    print(string.format("%s: {\n  value = %s\n  text_id = %d%s\n}", 
        key, item.value, item.text_id, 
        item.shortened_text and "\n  shortened_text = " .. item.shortened_text or ""))
end

-- Printing 'ordered_by_id' as a simple array
print("\nOrdered by text_id:")
-- use numeric loop to iterate from 1 to the length of the array
for i = 1, #ordered_by_id do
    print(ordered_by_id[i])
end

-- Printing 'sorted_by_length' as a simple array
print("\nSorted by Length:")
-- use generic loop to iterate through the values in the array
for _, text in ipairs(sorted_by_length) do
    print(text)
end
