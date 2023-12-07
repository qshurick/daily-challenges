import scala.List

val tests: List[(List[String], List[String])] = List(
    (List("at", "be", "th", "au"), List("beautiful", "the", "hat")),
    (List("ay", "be", "ta", "cu"), List("maybe", "beta", "abet", "course")),
    (List("th", "fo", "ma", "or"), List("the", "many", "for", "forest")),
    (List("oo", "mi", "ki", "la"), List("milk", "chocolate", "cooks"))
)

@main def main() = printTests(tests)

def canFind(bigrams: List[String])(words: List[String]): Boolean =
    (bigrams, words) match {
        case (List(), _) => true
        case (_, List()) => false
        case (bigrams, words) => canFind(missingBigram(bigrams)(words.last))(words.init)
    }

def missingBigram(bigrams: List[String])(word: String): List[String] = bigrams.filter(!word.contains(_))

def printTests(tests: List[(List[String], List[String])]): Unit = 
    tests.foreach((bigrams, words) => println ("[" + (bigrams.mkString(" ")) + "] can be found in [" + (words.mkString(" ")) + "] is " + canFind(bigrams)(words)))

