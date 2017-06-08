var text = "Help blah blah oh no Michael goes on out help \
next forth upcoming Michael heads long to outward into \
forth towards the horizon Michael enjoying fun along the way";
var myName = "Michael";
var hits = [];
for (var i = 0; i < text.length; i++) {
    if (text[i] === myName[0]) {
        for (var j = i; j < i + myName.length; j++) {
            hits.push(text[j]);
        }
    }
}
if (hits.length === 0) {
    console.log("Your naem wasn't found!");
}
else {
    console.log(hits);
}