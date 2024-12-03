import Algorithms

struct Day03: AdventDay {
  var data: String
  
  func part1() -> Int {
    let mulPattern = /mul\((\d+),(\d+)\)/
    var sum = 0
    for match in data.matches(of: mulPattern) {
      let num1 = Int(match.output.1)!
      let num2 = Int(match.output.2)!
      sum += num1 * num2
    }
    return sum
  }
  
  func part2() -> Int {
    let pattern = /mul\((\d+),(\d+)\)|do\(\)|don\'t\(\)/
    var sum = 0
    var enabled = true
    for match in data.matches(of: pattern) {
      let expr = match.output.0
      if expr == "don't()" {
        enabled = false
      } else if expr == "do()" {
        enabled = true
      } else {
        if enabled {
          let num1 = Int(match.output.1!)!
          let num2 = Int(match.output.2!)!
          sum += num1 * num2
        }
      }
    }
    return sum
  }
}
