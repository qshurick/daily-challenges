const CURRENT_GENERATION_OFFSET = 0;
const GRAND_GENERATION_OFFSET = 1;
const GREAT_GENERATION_OFFSET = 2;

const dictionary = {
	"m": ["son", "father"],
	"f": ["daughter", "mother"],
};

function generation(relativeGeneration, gender) {
	if (relativeGeneration === CURRENT_GENERATION_OFFSET) {
		return 'me!';
	}

    const generationOffset = Math.abs(relativeGeneration);
    const isPastGeneration = relativeGeneration < 0;

	const name = prefix + dictionary[gender][+isPastGeneration];
	const prefix = generationOffset > GRAND_GENERATION_OFFSET ? 'grand' : '';
	const greatness = Array(Math.max(0, generationOffset - GREAT_GENERATION_OFFSET))
        .fill('great ')
        .join('');
	
	return greatness + name;
}

console.log(generation(-3, "m"));
console.log(generation(-2, "m"));
console.log(generation(-1, "m"));
console.log(generation(0, "m"));
console.log(generation(1, "m"));
console.log(generation(2, "m"));
console.log(generation(3, "m"));

console.log(generation(-3, "f"));
console.log(generation(-2, "f"));
console.log(generation(-1, "f"));
console.log(generation(0, "f"));
console.log(generation(1, "f"));
console.log(generation(2, "f"));
console.log(generation(3, "f"));
