object A {
	def main(args: Array[String]) {
		val n = readInt()

		for (i <- 1 to n) {
			val alpha = readInt()
			println(if (360 % (180 - alpha) == 0) "YES" else "NO")
		}
	}
}
