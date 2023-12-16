program VowelToVowelLinks;
uses crt;

procedure VowelLinks(sentence : String);
const
    delimiter = ' ';
var
    index         : Integer;
    len           : Integer;
    isVowelLinked : Boolean;

    function isVowel(character : Char): Boolean;
    const
        vowels : array [1..5] of Char = ('a', 'e', 'i', 'o', 'u');
    var
        index : Integer;
    begin
        isVowel := False;
        for index := 1 to 5 do
            if vowels[index] = character then
                isVowel := True;
    end;

    function hasPreviousAndNextWord(
        currentPosition : Integer;
        len : Integer
    ): Boolean;
    begin
        hasPreviousAndNextWord := False;
        if (currentPosition > 1)
           and (currentPosition < len)
        then
            hasPreviousAndNextWord := True;
    end;

begin
    isVowelLinked := False;
    len           := byte(sentence[0]);

    for index := 1 to len do
        if (sentence[index] = delimiter)
           and hasPreviousAndNextWord(index, len)
           and isVowel(sentence[index - 1])
           and isVowel(sentence[index + 1])
        then
            isVowelLinked := True;

    if isVowelLinked then
        writeln('Sentence [' + sentence + '] is vowel linked!')
    else
        writeln('Sentence [' + sentence + '] is not vowel linked...')
end;

begin
    VowelLinks('a very large appliance');
    VowelLinks('go to edabit"');
    VowelLinks('an open fire');
    VowelLinks('a sudden applause');
end.
