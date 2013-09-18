object A {
    def main(args : Array[String]) : Unit = {
        val Array(x, y, z) = readLine.split(" ").map(s => s toInt);

        def side(x : Int, y : Int, z : Int) : Double = {
            scala.math.sqrt(x * y / z)
        }

        val sm = side(x, y, z) + side(y, z, x) + side(z, x, y)

        println((4 * sm) toInt)
    }
}
