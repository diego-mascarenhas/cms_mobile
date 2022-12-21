class User {
  final String name;
  final String email;
  final String image;

  const User({
    required this.name,
    required this.email,
    required this.image,
  });
}

final allUsers = [
  const User(
      name: 'Luke Skywalker',
      email: 'liku@hotmail.com',
      image:
          'https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg'),
  const User(
      name: 'C-3PO',
      email: 'C-3PO@hotmail.com',
      image:
          'https://vignette.wikia.nocookie.net/starwars/images/3/3f/C-3PO_TLJ_Card_Trader_Award_Card.png'),
  const User(
      name: 'Darth Vader',
      email: 'Darth_Vader@hotmail.com',
      image:
          'https://vignette.wikia.nocookie.net/fr.starwars/images/3/32/Dark_Vador.jpg'),
  const User(
      name: 'Leia Organa',
      email: 'Leia_Organa@hotmail.com',
      image:
          'https://vignette.wikia.nocookie.net/starwars/images/f/fc/Leia_Organa_TLJ.png'),
];
