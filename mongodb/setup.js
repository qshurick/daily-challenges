db.createCollection("dataSet");
db.dataSet.deleteMany({});
db.dataSet.insertMany([
    { censored: "Wh*r* d*d my v*w*ls g*?", vowels: "eeioeo" },
    { censored: "abcd", vowels: "" },
    { censored: "*PP*RC*S*", vowels: "UEAE" },
]);
