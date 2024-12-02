import Algorithms

struct Day02: AdventDay {
  var data: String
  
  var reports: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: " ").compactMap { Int($0) }
    }
  }
  
  func part1() -> Int {
    return reports.map(isSafe)
      .filter { $0 }
      .count
  }
  
  func part2() -> Int {
    return reports.map { report in
      var safe = false
      for i in 0..<report.count {
        var removedReport = report
        removedReport.remove(at: i)
        safe = safe || isSafe(report: removedReport)
      }
      return safe
    }
    .filter { $0 }
    .count
  }
  
  private func isSafe(report: [Int]) -> Bool {
    if report.count < 2 {
      return true
    }
    let firstDiff = report[1] - report[0]
    var safe = abs(firstDiff) <= 3 && abs(firstDiff) >= 1
    for i in 2..<report.count {
      let diff = report[i] - report[i-1]
      safe = safe && abs(diff) <= 3 && abs(diff) >= 1 && diff * firstDiff > 0
    }
    return safe
  }
}
