
object B {
    type Matrix = Array[Array[Char]]


    def main(args: Array[String]) {
        val (na, ma) = readLine.split(" ").map(_.toInt) match {
            case Array(x, y) => (x, y)
        }
        val a = (for (x <- (1 to na)) yield readLine.toArray).toArray
        val (nb, mb) = readLine.split(" ").map(_.toInt) match {
            case Array(x, y) => (x, y)
        }
        val b = (for (x <- (1 to nb)) yield readLine.toArray).toArray

        val matchValues = for (x <- -nb to na; y <- -mb to ma) yield shiftValue(a, b, x, y)
        println(matchValues max)
    }


    def shiftValue(a: Matrix, b: Matrix, x: Int, y: Int): Int = {
        val v = for (i <- 0 to (a.size - 1); j <- 0 to (a(0).size - 1);
            if 0 <= i + x && i + x < b.size;
            if 0 <= j + y && j + y < b(0).size) yield mul(a(i)(j), b(i + x)(j + x));
        v.sum
    }


    def mul(a: Char, b: Char): Int = (a, b) match {
        case ('1', '1') => 1
        case _ => 0
    }
}
