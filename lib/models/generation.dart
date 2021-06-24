class Generation {
  static List<String> getSlugs(int number) {
    switch (number) {
      case 1:
        return ['red-blue', 'yellow'];
      case 2:
        return ['gold-silver', 'crystal'];
      case 3:
        return ['ruby-sapphire', 'emerald', 'firered-leafgreen'];
      case 4:
        return ['diamond-pearl', 'platinum', 'heartgold-soulsilver'];
      case 5:
        return ['black-white', 'black-2-white-2'];
      case 6:
        return ['x-y', 'omega-ruby-alpha-sapphire'];
      case 7:
        return ['sun-moon', 'ultra-sun-ultra-moon'];
      case 8:
        return ['sword-shield'];
      default:
      return [];
    }
  }
}