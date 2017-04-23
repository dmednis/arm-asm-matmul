var h1 = 2;
var w1 = 3;
var m1 = [
    1, 2, 3,
    4, 5, 6
];

var h2 = 3;
var w2 = 2;
var m2 = [
    1, 2,
    4, 5,
    4, 5
];

var m3 = [
    0, 0,
    0, 0
];


for (var r1 = 0; r1 < h1; r1++) {
    for (var c2 = 0; c2 < w2; c2++) {
        var res = 0;
        for (var k = 0; k < w1; k++) {
            res += m1[k + r1 * w1] * m2[c2 + k * w2]
        }
        console.log(res)
    }
}