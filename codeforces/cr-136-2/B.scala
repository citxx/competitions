object B {
    def main(args: Array[String]) = {
        val a = readInt;
        val a_str = a toString;
        val ac2 = math.ceil(math.sqrt(a)) toInt;
        val af2 = math.floor(math.sqrt(a)) toInt;

        def good(x: Int): Boolean = x.toString exists {a_str contains _};

        val appropriateSmall = for (x <- (1 to af2)
            if a % x == 0 && good(x)) yield x;
        val appropriateBig = for (x <- (1 to (ac2 - 1))
            if a % x == 0 && good(a / x)) yield a / x;

        println((appropriateSmall length) + (appropriateBig length))
    }
}
