const input = {
    greeting: {
        eng: "Hello World!",
        swe: "Hallå Världen!",
        ger: "Hallo Welt!",
        lorem: "Lorem ipsum!",
        text_id: 1
    },
    headline: {
        eng: "This is a headline.",
        swe: "Det här en rubrik.",
        ger: "Dies ist eine Überschrift.",
        lorem: "Dolor sit amet.",
        text_id: 2
    },
    content: {
        eng: "This is the main content. It consists of two sentences.",
        swe: "Det här är huvudinnehållet. Det består av två meningar.",
        ger: "Dies ist der Hauptinhalt. Er besteht aus zwei Sätzen.",
        lorem: "Quisque at luctus libero. Lorem ipsum dolor sit amet.",
        text_id: 3
    },
    footer: {
        eng: "Last updated: February 15 2024.",
        swe: "Senast uppdaterad: 15 februari 2024.",
        ger: "Zuletzt aktualisiert: 15. Februar 2024.",
        lorem: "Donec iaculis facilisis: Jan 1 1970.",
        text_id: 4
    }
};

const lang_id = "swe";


let output = {};
for (const key in input) {
    // iterate over the input data and extract the relevant strings based on the lang_id.
    const text = input[key][lang_id] || input[key]["lorem"];
    let value = text;
    //handle optional tasks such as shortening texts longer than 20 characters.
    if (text.length > 20) {
        value = text.substring(0, 17) + "...";
    }
    output[key] = {
        value: value,
        text_id: input[key].text_id
    };
}
console.log(output);

//create ordered arrays based on text_id and sorted by text length.
const ordered_by_id = Object.values(output)
    .sort((a, b) => a.text_id - b.text_id)
    .map(item => item.value);
    console.log(ordered_by_id);

const sorted_by_length = Object.values(output)
    .sort((a, b) => a.value.length - b.value.length)
    .map(item => item.value);
    console.log(sorted_by_length);




