import Algorithms

struct Day01: AdventDay {
  var data: String
  
  var values: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: " ").compactMap { Int($0) }
    }
  }
  
  func part1() -> Any {
    let (left, right) = values.reduce(into: ([Int](), [Int]())) { acc, pair in
      acc.0.append(pair[0])
      acc.1.append(pair[1])
    }
    return zip(left.sorted(), right.sorted()).map{ abs($0 - $1) }.reduce(0, +)
  }
  
  func part2() -> Any {
    let counts = values.reduce(into: [Int: Int]()) { acc, pair in
      acc[pair[1], default: 0] += 1
    }
    return values.map { $0[0] * counts[$0[0], default: 0]} .reduce(0, +)
  }
}
