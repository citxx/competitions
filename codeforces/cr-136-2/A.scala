object A {
    def main(args: Array[String]) = {
        val n = readInt;
        val answer = n :: (1 to (n - 1) toList);
        println(answer map {_.toString} reduceLeft {_ + " " + _})
    }
}
