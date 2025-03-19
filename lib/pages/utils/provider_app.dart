import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sanremo_travel/pages/utils/classes.dart';

class ProviderApp extends ChangeNotifier {
  List<Full> get atractions => _atractions;
  List<Review> get review => _review;
  List<Full> get restaurants => _restaurants;
  List<Full> get beaches => _beaches;
  List<Full> get shopping => _shopping;
  List<Events> get events => _events;
  final List<Review> _review = [];
  final List<Events> _events = [
    Events(
      title: "San Remo Italian Song Festival",
      image: "images/q.png",
      date: "10-15 February",
      description:
          "The San Remo Music Festival is one of the most prestigious and well-known music festivals in Italy. "
          "It serves as a launching pad for both emerging and established artists. Many Italian hits have debuted here, "
          "and the festival continues to capture the hearts of music lovers every year. "
          "With a vibrant atmosphere, dazzling performances, and an enthusiastic audience, this event is a must-see for anyone visiting San Remo. "
          "The festival features live performances by famous artists, intense competition, and a grand final where the winner is crowned. "
          "Music lovers can experience a mix of pop, classical, and contemporary music, making it a diverse and thrilling event.",
      local:
          "The festival takes place at the Ariston Theatre in San Remo, a central venue for the event.",
    ),
    Events(
      title: "San Remo Carnival",
      image: "images/z.png",
      date: "20-25 February",
      description:
          "The San Remo Carnival is a vibrant and colorful festival that takes over the streets of the city every year. "
          "Filled with grand parades, elaborate costumes, and joyful music, this event is a spectacle of creativity and culture. "
          "People from all over Italy gather to participate in this festive celebration, where traditional dances and theatrical performances add to the excitement. "
          "One of the highlights of the carnival is the spectacular float parade, where massive, beautifully decorated floats roll through the city, "
          "each telling a unique story or representing different cultural themes. If you enjoy lively celebrations, delicious street food, and a lively atmosphere, "
          "the San Remo Carnival is the perfect event for you.",
      local:
          "The carnival is held in the streets of San Remo, particularly in the historic center, with parades moving along Via Matteotti and Corso Imperatrice.",
    ),
    Events(
      title: "Yacht Racing",
      image: "images/w.png",
      date: "March 5-7",
      description:
          "San Remo’s Yacht Racing event is one of the most prestigious sailing competitions in the region. "
          "Professional sailors and yacht enthusiasts from around the world gather to compete in this thrilling race, "
          "set against the stunning backdrop of the Ligurian Sea. "
          "The event includes different categories of races, from small sailing boats to luxury yachts, showcasing incredible skills and teamwork. "
          "Spectators can enjoy the races from the shore or take boat tours to get a closer look at the action. "
          "Beyond the competition, the event offers networking opportunities for sailing professionals, as well as fun activities for visitors, "
          "such as sailing workshops and sunset cruises. "
          "If you're passionate about the sea and adventure, this is a must-attend event.",
      local:
          "The Yacht Racing event takes place in the Ligurian Sea, with the main base at the San Remo Port.",
    ),
    Events(
      title: "Flower Festival",
      image: "images/x.png",
      date: "April 10-12",
      description:
          "The San Remo Flower Festival, also known as 'Corso Fiorito,' is a breathtaking celebration of nature and beauty. "
          "Each spring, the streets of San Remo are transformed into a floral paradise, filled with thousands of colorful flowers arranged in stunning artistic displays. "
          "One of the main attractions is the floral float parade, where large, beautifully decorated floats covered in fresh flowers "
          "parade through the city, competing for the most creative and impressive design. "
          "The festival also includes floral arrangement competitions, street performances, and live music, creating a magical atmosphere. "
          "Visitors can also explore San Remo’s botanical gardens and flower markets, where they can purchase rare and exotic flowers. "
          "This event is a dream come true for nature lovers and photography enthusiasts.",
      local:
          "The event takes place in the historic center of San Remo, with the floral floats parading along Corso Imperatrice and other city streets.",
    ),
    Events(
      title: "Classical Music Concert",
      image: "images/v.png",
      date: "May 18",
      description:
          "For lovers of classical music, the annual Classical Music Concert in San Remo is an unforgettable experience. "
          "Held in one of the city’s historic concert halls, this event features performances by world-renowned orchestras, "
          "talented soloists, and famous conductors. The program includes masterpieces from composers like Mozart, Beethoven, and Vivaldi, "
          "offering a mesmerizing journey through the best of classical music. "
          "The concert hall itself provides a grand and elegant setting, with exquisite acoustics that enhance the beauty of every note played. "
          "Beyond the performances, attendees can participate in exclusive meet-and-greet sessions with the artists and attend musical workshops. "
          "This event is a perfect way to experience the rich cultural heritage of San Remo and immerse yourself in the magic of classical music.",
      local:
          "The concert is held at the Teatro Ariston, one of San Remo’s most prestigious and historic venues.",
    ),
  ];
  final List<Full> _beaches = [
    Full(
      title: "Tre Ponti",
      image: "images/f.png",
      description:
          "A sandy beach with crystal-clear waters, perfect for families.",
      local: "Located near Sanremo, offering a relaxing atmosphere.",
      history: "A popular destination for locals and visitors for decades.",
      fact: "Great spot for surfing and sunbathing.",
      coordinates: LatLng(43.8193, 7.7597), // Near Sanremo, land-based beach
    ),
    Full(
      title: "Bagni Serenella",
      image: "images/e.png",
      description: "A well-maintained beach with sunbeds and a beach bar.",
      local: "Situated in a quiet bay with scenic views.",
      history: "Has been a go-to summer escape for generations.",
      fact: "Known for its excellent beachside service and fresh seafood.",
      coordinates: LatLng(43.8182, 7.7738), // Near Sanremo city center
    ),
    Full(
      title: "Bagni Paradiso",
      image: "images/d.png",
      description:
          "A tropical-style beach with soft sand and turquoise waters.",
      local: "Nestled in a peaceful area with a laid-back vibe.",
      history: "One of the oldest beaches in the region, loved by locals.",
      fact: "Offers sunset yoga sessions right on the shore.",
      coordinates: LatLng(43.8175, 7.7750), // Near Sanremo, land-based beach
    ),
  ];

  final List<Full> _shopping = [
    Full(
      title: "Mercato Bisettimanale di Sanremo",
      image: "images/g.png",
      description: "A bustling open-air market with a variety of local goods.",
      local: "Held twice a week in the heart of Sanremo.",
      history:
          "A traditional marketplace offering fresh produce and artisanal crafts.",
      fact: "A great place to find unique souvenirs and fresh delicacies.",
      coordinates: LatLng(43.8180, 7.7730), // Sanremo city center
    ),
    Full(
      title: "Mercato Annonario",
      image: "images/h.png",
      description:
          "A vibrant indoor market with fresh food and local specialties.",
      local: "Located in a historic building in the city center.",
      history: "A long-standing market offering the best of Italian cuisine.",
      fact: "Famous for its selection of cheeses, meats, and fresh pasta.",
      coordinates: LatLng(43.8131, 7.7752), // Sanremo city center
    ),
    Full(
      title: "The Mall Sanremo",
      image: "images/i.png",
      description: "A luxury shopping destination with top designer brands.",
      local: "Situated just outside the city, offering a high-end experience.",
      history: "A modern shopping center attracting fashion lovers.",
      fact: "Home to exclusive fashion outlets with great discounts.",
      coordinates: LatLng(43.8195, 7.7582), // Near Sanremo
    ),
  ];

  final List<Full> _atractions = [
    Full(
      title: "San Remo",
      image: "images/1.jpg",
      description:
          "Famous known for its elegant Art Nouveau architecture and rich history.",
      local: "Corso degli Inglesi, 18, 18038 Sanremo IM, Italy",
      history:
          "Opened in 1905,has been a hotspot for high society and a symbol of San Remo's nightlife.",
      fact:
          "The San Remo Music Festival, Italy’s most famous song contest, originated here in 1951.",
      coordinates: LatLng(43.8108, 7.7732), // San Remo city center
    ),
    Full(
      title: "Villa Nobel",
      image: "images/2.png",
      description:
          "The historic home of Alfred Nobel, now a museum showcasing his life and work.",
      local: "Corso Felice Cavallotti, 116, 18038 Sanremo IM, Italy",
      history:
          "Alfred Nobel, the inventor of dynamite and founder of the Nobel Prize, lived here in the late 19th century.",
      fact:
          "Alfred Nobel referred to this villa as 'my nest' and spent his last years here working on his inventions.",
      coordinates: LatLng(43.8125, 7.7743), // Near Sanremo
    ),
    Full(
      title: "Portosole",
      image: "images/3.png",
      description:
          "A luxurious marina with high-end yachts, restaurants, and scenic sea views.",
      local: "Portosole, 18038 Sanremo IM, Italy",
      history:
          "One of the most important marinas in the Ligurian Riviera, attracting international visitors and yacht owners.",
      fact:
          "Portosole is one of the largest marinas in the Mediterranean, accommodating yachts over 90 meters long.",
      coordinates: LatLng(43.8123, 7.7648), // Near Sanremo, land-based
    ),
    Full(
      title: "La Pigna (Old Town)",
      image: "images/4.png",
      description:
          "A charming medieval district with narrow streets, stairways, and historic buildings.",
      local: "Centro Storico, 18038 Sanremo IM, Italy",
      history:
          "Dating back to the Middle Ages, La Pigna offers a glimpse into the old-world charm of San Remo.",
      fact:
          "The winding streets of La Pigna were designed to protect the town from pirate invasions in medieval times.",
      coordinates: LatLng(43.8137, 7.7753), // Sanremo city center
    ),
  ];
  final List<Full> _restaurants = [
    Full(
      title: "Il Giardino Restaurant & Bar",
      image: "images/shadsa.png",
      description: "Enjoy a delightful culinary experience in a cozy ambiance.",
      local: "Located in the heart of the city, offering authentic flavors.",
      history: "A historic venue known for its exquisite Italian cuisine.",
      fact: "Famous for its handcrafted pasta and signature cocktails.",
      coordinates: LatLng(43.8156, 7.7766), // Near Sanremo
    ),
    Full(
      title: "Nessun Dorma Cinque Terre",
      image: "images/a.png",
      description:
          "A perfect place to enjoy fresh local ingredients with a view.",
      local: "Situated on a cliffside, overlooking the stunning coastline.",
      history: "A well-loved spot for both locals and tourists alike.",
      fact:
          "Named after the famous opera, offering a musical dining experience.",
      coordinates: LatLng(43.8150, 7.7765), // Updated to near Sanremo
    ),
    Full(
      title: "L'Ancora Della Tortuga",
      image: "images/b.png",
      description:
          "A romantic seaside restaurant with top-tier Mediterranean dishes.",
      local: "Nestled near the water, offering a serene dining experience.",
      history:
          "A family-run business that has been serving fresh seafood for decades.",
      fact: "Renowned for its lobster pasta and sunset views.",
      coordinates: LatLng(43.8140, 7.7750), // Near Sanremo
    ),
    Full(
      title: "Consani Osteria",
      image: "images/c.png",
      description: "A rustic spot offering authentic Ligurian cuisine.",
      local: "Tucked away in a picturesque alley, full of character.",
      history:
          "A hidden gem known for its warm hospitality and classic recipes.",
      fact: "Famous for its handmade focaccia and local wines.",
      coordinates: LatLng(43.8227, 7.7763), // Near Sanremo
    ),
  ];

  final List<Recomendation> _recomand = [
    Recomendation(
      name: "Early Start",
      descirption:
          "Start your day as early as possible, preferably before sunrise. The morning hours are a magical time when the city is still asleep, and you can enjoy the peace and quiet. This is especially important if you plan to visit popular attractions that can get crowded during the day. For example, if you plan to visit a monument or a museum, check when they open and try to be there right at opening time.",
    ),
    Recomendation(
      name: "Plan Ahead",
      descirption:
          "Before you head out on your trip, take some time to research the places you want to visit. Make a list of attractions, restaurants, and interesting spots. You can use apps for route planning, such as Google Maps or specialized travel apps, which can help create an optimal itinerary. Try to group places by proximity to minimize travel time.",
    ),
    Recomendation(
      name: "Breaks for Rest",
      descirption:
          "Don’t forget that traveling is not just about sightseeing but also about relaxing and enjoying the atmosphere. Schedule breaks to sit in a café, observe the local life, or just take a stroll in the park. This will help you recharge and appreciate the surrounding nature.",
    ),
    Recomendation(
      name: "Flexibility in Schedule",
      descirption:
          "While planning is good, sometimes it’s worth leaving room for improvisation. If you stumble upon something interesting along the way, don’t hesitate to change your plans. You might find a unique café, a street market, or a local festival that you didn’t know about beforehand. Flexibility in your schedule will make your journey more exciting and memorable.",
    ),
    Recomendation(
      name: "Explore Local Culture",
      descirption:
          "Before heading to a new place, familiarize yourself with its history, customs, and traditions. This will not only help you understand the local atmosphere better but also avoid awkward situations. For example, in some countries, there may be specific rules of behavior in public places or when interacting with locals. Respecting culture and traditions will enhance your travel experience.",
    ),
    Recomendation(
      name: "Check Opening Hours",
      descirption:
          "Before heading to any location, check its opening hours. Many attractions, shops, and restaurants may have limited hours, especially during holidays or weekends. Make sure you have enough time to visit all the planned places to avoid missing out on something interesting.",
    ),
    Recomendation(
      name: "Eat Well",
      descirption:
          "One of the best parts of traveling is the opportunity to try local cuisine. Don’t miss the chance to visit local markets and restaurants serving traditional dishes. This is not only delicious but also allows you to learn more about the culture of the country. Try to ask locals for their recommendations—this often leads to the most interesting discoveries.",
    ),
    Recomendation(
      name: "Capture Memories",
      descirption:
          "Take photos and keep a travel journal. This will help you preserve memories of the wonderful moments you experienced. Write down your impressions, thoughts, and emotions while you’re in a particular place. Later, these entries will be a great way to reminisce about your adventures and share them with friends and family.",
    ),
    Recomendation(
      name: "Use Public Transport",
      descirption:
          "Explore public transport options in the city you’re visiting. It’s not only cost-effective but also gives you a chance to get a better feel for local life. Using the subway, buses, or trams can save you time and allow you to see more than just tourist areas. Additionally, this can be an exciting experience, immersing you in the everyday lives of locals.",
    ),
    Recomendation(
      name: "Take Care of Your Health",
      descirption:
          "It’s important to keep an eye on your health while traveling. Make sure you drink enough water, especially in hot weather. Don’t forget to snack to maintain your energy levels. If you feel tired, don’t hesitate to take a break and rest. Sometimes it’s better to spend an hour or two in the shade than to overexert yourself and ruin your day.",
    ),
  ];

  void addReview(String attractionTitle, Review review) {
    final attraction = _atractions.firstWhere(
      (a) => a.title == attractionTitle,
      orElse:
          () => Full(
            title: '',
            image: '',
            description: '',
            local: '',
            history: '',
            fact: '',
            review: [],
            coordinates: LatLng(0, 0),
          ),
    );

    if (attraction.title.isNotEmpty) {
      attraction.review.add(review);
      notifyListeners(); // Notify UI to update
    }
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  final List<RouteModel> _routemodel = [];
  List<RouteModel> get routemodel => _routemodel;

  void addRouteModel(RouteModel routemodel) {
    _routemodel.add(routemodel);
    notifyListeners();
  }
}
