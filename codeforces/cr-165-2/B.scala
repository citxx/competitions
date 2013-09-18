import scala.annotation.tailrec

object B {
    def main(args: Array[String]) {
        val (f :: a) = io.Source.stdin.getLines.toList.tail.head.split(" ").toList.reverse map {_.toInt}
    
        println(solve(f, a, 0))
    }
    
    @tailrec
    def solve(mn: Int, a: Traversable[Int], result: Int): Int = {
        if (a.isEmpty) result
        else {
            val (x :: n_a) = a
            val n_mn = math.min(mn, x)
            val n_result = result + (if (x > mn) 1 else 0)
            solve(n_mn, n_a, n_result)
        }
    }
}
