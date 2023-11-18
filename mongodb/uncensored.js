db.dataSet.aggregate([
    {
        $project: {
            vowels: 1,
            censored: 1,
            replaceMap: {
                $regexFindAll: {
                    input: "$censored",
                    regex: /[^*]*\*[^*]*/
                }
            },
            vowelsList: {
                $map: {
                    input: {
                        $range: [0, {$strLenCP: "$vowels"}]
                    },
                    in: {
                        $substrCP: ["$vowels", "$$this", 1]
                    }
                }
            }
        }
    },
    {
        $unwind: {
            path: "$vowelsList",
            includeArrayIndex: "order",
            preserveNullAndEmptyArrays: true
        }
    }, 
    {
        $project: {
            vowels: 1,
            censored: 1,
            order: 1,
            uncensoredPart: {
                $replaceOne: {
                    input: {$first: {$slice:["$replaceMap.match", "$order", 1]}},
                    find: "*",
                    replacement: "$vowelsList"
                }
            },
            match: {$slice:["$replaceMap.match", "$order", 1]}
        }
    },
    {
        $sort: {
            _id: 1,
            order: 1
        }
    },
    {
        $group: {
            _id: "$_id",
            vowels: {$first: "$vowels"},
            censored: {$first: "$censored"},
            uncensored: {$push: "$uncensoredPart"}
        }
    }, 
    {
        $project: {
            uncensored: {
                $ifNull: [
                    {
                        $reduce: {
                            input: "$uncensored",
                            initialValue: "",
                            in: {$concat: ["$$value", "$$this"]}
                        }
                    },
                    "$censored"
                ]
            },
            vowels: 1,
            censored: 1
        }
    }
]);
