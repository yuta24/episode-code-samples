

let x = ("qwertyuio").suffix(3)

x.base
x.base[x.startIndex]
x.endIndex
x.distance(from: x.base.startIndex, to: x.startIndex)

//
//struct Parser<A> {
//  let run: (inout Substring) -> A?
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//let int = Parser<Int> { str in
//  let prefix = str.prefix(while: { $0.isNumber })
//  let match = Int(prefix)
//  str.removeFirst(prefix.count)
//  return match
//}
//
//let double = Parser<Double> { str in
//  let prefix = str.prefix(while: { $0.isNumber || $0 == "." })
//  let match = Double(prefix)
//  str.removeFirst(prefix.count)
//  return match
//}
//
//let char = Parser<Character> { str in
//  guard !str.isEmpty else { return nil }
//  return str.removeFirst()
//}
//
//func literal(_ p: String) -> Parser<Void> {
//  return Parser<Void> { str in
//    guard str.hasPrefix(p) else { return nil }
//    str.removeFirst(p.count)
//    return ()
//  }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//func always<A>(_ a: A) -> Parser<A> {
//  return Parser<A> { _ in a }
//}
//
//extension Parser {
//  static var never: Parser {
//    return Parser { _ in nil }
//  }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//extension Parser {
//  func map<B>(_ f: @escaping (A) -> B) -> Parser<B> {
//    return Parser<B> { str -> B? in
//      self.run(&str).map(f)
//    }
//  }
//
//  func flatMap<B>(_ f: @escaping (A) -> Parser<B>) -> Parser<B> {
//    return Parser<B> { str -> B? in
//      let original = str
//      let matchA = self.run(&str)
//      let parserB = matchA.map(f)
//      guard let matchB = parserB?.run(&str) else {
//        str = original
//        return nil
//      }
//      return matchB
//    }
//  }
//}
//
//func zip<A, B>(_ a: Parser<A>, _ b: Parser<B>) -> Parser<(A, B)> {
//  return Parser<(A, B)> { str -> (A, B)? in
//    let original = str
//    guard let matchA = a.run(&str) else { return nil }
//    guard let matchB = b.run(&str) else {
//      str = original
//      return nil
//    }
//    return (matchA, matchB)
//  }
//}
//
//
//
//
//
//func zip<A, B, C>(
//  _ a: Parser<A>,
//  _ b: Parser<B>,
//  _ c: Parser<C>
//  ) -> Parser<(A, B, C)> {
//  return zip(a, zip(b, c))
//    .map { a, bc in (a, bc.0, bc.1) }
//}
//func zip<A, B, C, D>(
//  _ a: Parser<A>,
//  _ b: Parser<B>,
//  _ c: Parser<C>,
//  _ d: Parser<D>
//  ) -> Parser<(A, B, C, D)> {
//  return zip(a, zip(b, c, d))
//    .map { a, bcd in (a, bcd.0, bcd.1, bcd.2) }
//}
//func zip<A, B, C, D, E>(
//  _ a: Parser<A>,
//  _ b: Parser<B>,
//  _ c: Parser<C>,
//  _ d: Parser<D>,
//  _ e: Parser<E>
//  ) -> Parser<(A, B, C, D, E)> {
//
//  return zip(a, zip(b, c, d, e))
//    .map { a, bcde in (a, bcde.0, bcde.1, bcde.2, bcde.3) }
//}
//func zip<A, B, C, D, E, F>(
//  _ a: Parser<A>,
//  _ b: Parser<B>,
//  _ c: Parser<C>,
//  _ d: Parser<D>,
//  _ e: Parser<E>,
//  _ f: Parser<F>
//  ) -> Parser<(A, B, C, D, E, F)> {
//  return zip(a, zip(b, c, d, e, f))
//    .map { a, bcdef in (a, bcdef.0, bcdef.1, bcdef.2, bcdef.3, bcdef.4) }
//}
//func zip<A, B, C, D, E, F, G>(
//  _ a: Parser<A>,
//  _ b: Parser<B>,
//  _ c: Parser<C>,
//  _ d: Parser<D>,
//  _ e: Parser<E>,
//  _ f: Parser<F>,
//  _ g: Parser<G>
//  ) -> Parser<(A, B, C, D, E, F, G)> {
//  return zip(a, zip(b, c, d, e, f, g))
//    .map { a, bcdefg in (a, bcdefg.0, bcdefg.1, bcdefg.2, bcdefg.3, bcdefg.4, bcdefg.5) }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//extension Parser {
//  func run(_ str: String) -> (match: A?, rest: Substring) {
//    var str = str[...]
//    let match = self.run(&str)
//    return (match, str)
//  }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//// 40.446° N, 79.982° W
//struct Coordinate {
//  let latitude: Double
//  let longitude: Double
//}
//
//func prefix(while p: @escaping (Character) -> Bool) -> Parser<Substring> {
//  return Parser<Substring> { str in
//    let prefix = str.prefix(while: p)
//    str.removeFirst(prefix.count)
//    return prefix
//  }
//}
//
////let zeroOrMoreSpaces = Parser<Void> { str in
////  let prefix = str.prefix(while: { $0 == " " })
////  str.removeFirst(prefix.count)
////  return ()
////}
//let zeroOrMoreSpaces = prefix(while: { $0 == " " })
//  .map { _ in () }
//
////let oneOrMoreSpaces = Parser<Void> { str in
////  let prefix = str.prefix(while: { $0 == " " })
////  guard !prefix.isEmpty else { return nil }
////  str.removeFirst(prefix.count)
////  return ()
////}
//let oneOrMoreSpaces = prefix(while: { $0 == " " })
//  .flatMap { str in
//    str.isEmpty ? .never
//      : always(())
//}
//
//
//let northSouth = char
//  .flatMap {
//    $0 == "N" ? always(1.0)
//      : $0 == "S" ? always(-1)
//      : .never
//}
//let eastWest = char
//  .flatMap {
//    $0 == "E" ? always(1.0)
//      : $0 == "W" ? always(-1)
//      : .never
//}
//let latitude = zip(
//  double,
//  literal("°"),
//  oneOrMoreSpaces,
//  northSouth
//  )
//  .map { lat, _, _, latSign in lat * latSign }
//let longitude = zip(
//  double,
//  literal("°"),
//  oneOrMoreSpaces,
//  eastWest
//  )
//  .map { long, _, _, longSign in long * longSign }
//let coord = zip(
//  zeroOrMoreSpaces,
//  latitude,
//  literal(","),
//  oneOrMoreSpaces,
//  longitude
//  )
//  .map { _, lat, _, _, long in
//    Coordinate(
//      latitude: lat,
//      longitude: long
//    )
//}
//
//
//oneOrMoreSpaces.run("   Hello World")
//oneOrMoreSpaces.run("Hello World")
//
//coord.run("40.446° N, 79.982° W")
//coord.run("40.446°   N,   79.982°   W")
//coord.run("    40.446°   N,   79.982°   W")
//
//
//import Foundation
//let df = DateFormatter()
//df.dateStyle = .medium
//
//print(df.date(from: "Jan 29, 2018"))
//print(df.date(from: "   Jan   29,   2018"))
//
//
//
//try NSRegularExpression(pattern: " *")
//
//
//
//Scanner().charactersToBeSkipped = .whitespaces
//
//
//
//// Parser<A> -> Parser<[A]>
//
//func zeroOrMore<A>(_ p: Parser<A>, separatedBy s: Parser<Void>) -> Parser<[A]> {
//  return Parser<[A]> { str -> [A]? in
//    var last = str
//    var matches: [A] = []
//    while let match = p.run(&str) {
//      last = str
//      matches.append(match)
//      if s.run(&str) == nil {
//        return matches
//      }
////      if str.hasPrefix(s) {
////        str.removeFirst(s.count)
////      } else {
////        return matches
////      }
//    }
//    str = last
//    return matches
//  }
//}
//
//
//enum Currency { case eur, gbp, usd }
//let currency = char.flatMap {
//  $0 == "€" ? always(Currency.eur)
//    : $0 == "£" ? always(.gbp)
//    : $0 == "$" ? always(.usd)
//    : .never
//}
//
//
//struct Money {
//  let currency: Currency
//  let value: Double
//}
//let money = zip(currency, double).map(Money.init)
//
//
//money.run("$42")
//
//let charges = "$42,£42,€42"
//
//money.run(charges)
//
//
//zeroOrMore(money, separatedBy: literal(",")).run(charges).match
//
//let monies = zeroOrMore(money, separatedBy: literal(","))
//monies.run("$42$42,£42,€42").match
//monies.run("$42,£42,€42,")
//
//let commaOrNewline = char
//  .flatMap { c in
//    c == "," || c == "\n" ? always(())
//      : .never
//}
//
//zeroOrMore(money, separatedBy: commaOrNewline).run("""
//$42,£42,€42
//$50,£100.25
//""").match
//
//
//struct Race {
//  let location: String
//  let entranceFee: Money
//  let path: [Coordinate]
//}
//
//let location = prefix(while: { $0 != "," }).map(String.init)
//
//let race: Parser<Race> = zip(
//  location,
//  literal(","),
//  oneOrMoreSpaces,
//  money,
//  literal("\n"),
//  zeroOrMore(coord, separatedBy: literal("\n"))
//  ).map { location, _, _, entranceFee, _, path in
//    Race(location: location, entranceFee: entranceFee, path: path)
//}
//
//let races: Parser<[Race]> = zeroOrMore(race, separatedBy: literal("\n---\n"))
//
//
//let upcomingRaces = """
//Boston, $200
//42.228962° N, 71.52194° W
//42.256507° N, 71.464005° W
//42.273562° N, 71.439843° W
//42.279754° N, 71.40491° W
//42.284389° N, 71.345687° W
//42.296866° N, 71.305304° W
//42.298992° N, 71.289082° W
//42.316194° N, 71.270242° W
//42.328981° N, 71.25123° W
//42.341163° N, 71.238656° W
//42.337262° N, 71.185913° W
//42.340465° N, 71.16055° W
//42.336564° N, 71.150723° W
//42.3424° N, 71.121454° W
//42.34903° N, 71.097379° W
//42.349712° N, 71.086028° W
//42.348062° N, 71.085212° W
//42.350298° N, 71.076694° W
//---
//New York City, $300
//40.602484° N, 74.064331° W
//40.618078° N, 74.029666° W
//40.649533° N, 74.009293° W
//40.678846° N, 73.981986° W
//40.698943° N, 73.957014° W
//40.72791° N, 73.953141° W
//40.748823° N, 73.94221° W
//40.7574° N, 73.953094° W
//40.761496° N, 73.96142° W
//40.771115° N, 73.953622° W
//40.802603° N, 73.930617° W
//40.804097° N, 73.928933° W
//40.814329° N, 73.932924° W
//40.80325° N, 73.944729° W
//40.773924° N, 73.969173° W
//40.772937° N, 73.976719° W
//"""
//
//dump(
//races.run(upcomingRaces)
//)
