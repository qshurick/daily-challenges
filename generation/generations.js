const dictionary = {
	"m": ["son", "father"],
	"f": ["daughter", "mother"],
};

function generation(relativeGeneration, gender) {
	if (relativeGeneration === 0) {
		return 'me!';
	}

	const prefix = relativeGeneration < -1 || relativeGeneration > 1 ? 'grand' : '';
	const name = prefix + dictionary[gender][+(relativeGeneration < 0)];
	const greatness = Array(Math.max(0, Math.abs(relativeGeneration) - 2)).fill('great ').join('');
	
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
