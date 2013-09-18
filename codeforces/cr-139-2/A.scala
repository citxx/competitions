object A {
    def main(args: Array[String]) = {
        val n = readInt;
        val top = readInt;
        val sides = for (s <- io.Source.stdin.getLines)
            yield s.split(" ") match {case Array(x, y, _*) => (x.toInt, y.toInt)};
        def bad(x: Int) = x == top || x == 7 - top;
        val badCubes = for ((x, y) <- sides if bad(x) || bad(y)) yield  ();
        println(if (badCubes isEmpty) "YES" else "NO")
    }
}
