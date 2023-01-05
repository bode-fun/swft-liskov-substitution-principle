// baseclass: Tiger
class Tiger {
  func eat() {
    print("🐯 Tiger is eating 🐯")
  }
}

// subclass: Cat (inherits from Tiger)
class Cat: Tiger {
  var name: String

  init(name: String) {
    self.name = name
  }

  override func eat() {
    print("🐱 Cat is eating 🐱")
  }
}

// subclass: BabyCat (inherits from Cat)
class BabyCat: Cat {
  override func eat() {
    print("🐱 Baby \(name) is eating 🐱")
  }
}

// CatRestaurant class that takes a generic type T that inherits from Tiger
class CatRestaurant<T: Tiger> {
  var cats: [T]
  
  init(cats: [T]) {
    self.cats = cats
  }

  func serve() {
    print("🍣🍤🍱 Cat restaurant is serving food 🍣🍤🍱")
    for cat in cats {
      cat.eat()
    }
  }
}

// CatRestaurant that takes an array of Cat objects and does not follow the Liskov Substitution Principle
class InvalidCatRestaurant {
  var cats: [Cat]
  
  init(cats: [Cat]) {
    self.cats = cats
  }

  func serve() {
    print("🍣🍤🍱 Invalid cat restaurant is serving food 🍣🍤🍱")
    for cat in cats {
      cat.eat()
    }
  }
}

@main
struct Main {
  static func main() {
    pureCats()
    mixedCats()
  }

  static func pureCats() {
    let bingus = Cat(name: "Bingus")
    let pumpkin = BabyCat(name: "Pumpkin")

    let catRestaurant: CatRestaurant<Cat> = CatRestaurant(cats: [bingus, pumpkin])
    catRestaurant.serve()

    let invalidCatRestaurant = InvalidCatRestaurant(cats: [
      bingus, pumpkin,
    ])
    invalidCatRestaurant.serve()
  }

  static func mixedCats() {
    let bingus = Cat(name: "Bingus")
    let pumpkin = BabyCat(name: "Pumpkin")
    let tiger = Tiger()

    let catRestaurant = CatRestaurant(cats: [bingus, pumpkin, tiger])
    catRestaurant.serve()

    // let invalidCatRestaurant = InvalidCatRestaurant(cats: [bingus, pumpkin, tiger])
    // invalidCatRestaurant.serve()
  }
}
