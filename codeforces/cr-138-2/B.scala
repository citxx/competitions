object A {
    def main(args: Array[String]): Unit = {
        val Array(n, k) = readLine.split(" ").map(s => s toInt);
        val a = readLine.split(" ").map(s => s toInt);

        def segCount(s: List[Int]): Int = s match {
            case Nil => 0
            case _ :: Nil => 1
            case x :: y :: tail => if (x == y) segCount(y :: tail) else 1 + segCount(y :: tail)
        }
    }
}
