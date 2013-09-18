import scala.annotation.tailrec

object B {
    def main(args: Array[String]) {
        val List(n_r, cubes_r @ _*) = io.Source.stdin.getLines.toList
        val n = n_r.toInt
        val cubes = cubes_r map {_.split(" ") map {_.toInt} toList} map {case List(a, b) => (a, b)}
    
        println(solve(f, a, 0))
    }
}
