import 'package:flutter/material.dart';
import 'package:recipeapp_animation/constants/colors.dart';
import 'package:recipeapp_animation/util/screen_util.dart';
import 'package:recipeapp_animation/util/text_util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // ---------- DATA ----------
  final List<_Recipe> recipes = const [
        _Recipe(
      title: 'Pepperoni Pizza',
      image: 'assets/images/6.png',
      gradient: [Color.fromARGB(255, 253, 68, 58), Color.fromARGB(255, 247, 51, 40)],
      difficulty: RecipeDifficulty.medium,
      timeMin: 30,
      kcal: 420.0,
      persons: '2-3 person',
      description:
          'Classic pepperoni pizza with a crispy crust, tangy tomato sauce, and perfectly melted mozzarella cheese topped with spicy pepperoni.',
      ingredients: [
        'Pizza dough (store-bought or homemade)',
        '1/2 cup pizza sauce',
        '2 cups shredded mozzarella cheese',
        '4 oz sliced pepperoni',
        '1 tbsp olive oil',
        'Italian seasoning',
        'Red pepper flakes (optional)',
      ],
      instructions: [
        'Preheat oven to 475°F (245°C)',
        'Roll out pizza dough on a floured surface',
        'Transfer to a pizza pan or baking sheet',
        'Brush edges with olive oil and spread sauce evenly',
        'Add mozzarella cheese and arrange pepperoni on top',
        'Sprinkle with Italian seasoning and red pepper flakes',
        'Bake for 12-15 minutes until crust is golden and cheese is bubbly',
      ],
    ),
       _Recipe(
      title: 'Fettuccine Pasta',
      image: 'assets/images/2.png',
      gradient: [
        Color.fromARGB(255, 108, 253, 229),
        Color.fromARGB(255, 54, 206, 180),
      ],
      difficulty: RecipeDifficulty.easy,
      timeMin: 12,
      kcal: 170.0,
      persons: '1 person',
      description:
          'Creamy fettuccine pasta with a rich and velvety sauce. Simple ingredients come together for an elegant and satisfying meal.',
      ingredients: [
        '4 oz fettuccine pasta',
        '2 tbsp butter',
        '1/4 cup heavy cream',
        '1/3 cup grated Parmesan cheese',
        '1 clove garlic, minced',
        'Salt and white pepper to taste',
        'Fresh parsley for garnish',
      ],
      instructions: [
        'Cook fettuccine according to package directions until al dente',
        'Meanwhile, melt butter in a large skillet over medium heat',
        'Add minced garlic and sauté for 30 seconds',
        'Add cream and simmer for 2 minutes',
        'Drain pasta, reserving 1/4 cup pasta water',
        'Add pasta to skillet with sauce and toss',
        'Add Parmesan cheese and pasta water as needed for consistency',
        'Season with salt and pepper, garnish with parsley',
      ],
    ),
    _Recipe(
      title: 'Flank Steak',
      image: 'assets/images/4.png',
      gradient: [Color.fromARGB(255, 252, 192, 27), Color.fromARGB(255, 255, 128, 0)],
      difficulty: RecipeDifficulty.easy,
      timeMin: 10,
      kcal: 301.6,
      persons: '1-4 person',
      description:
          'A perfectly seasoned flank steak with a beautiful char and tender interior. This quick-cooking cut is ideal for weeknight dinners.',
      ingredients: [
        '1 lb flank steak',
        '2 tbsp olive oil',
        '1 tsp garlic powder',
        '1 tsp paprika',
        'Salt and pepper to taste',
        'Fresh herbs for garnish',
      ],
      instructions: [
        'Let steak come to room temperature for 30 minutes',
        'Season both sides generously with salt, pepper, garlic powder, and paprika',
        'Heat olive oil in a cast iron skillet over medium-high heat',
        'Cook steak for 4-5 minutes per side for medium-rare',
        'Let rest for 5 minutes before slicing against the grain',
        'Garnish with fresh herbs and serve immediately',
      ],
    ),
   
      _Recipe(
      title: 'Ribs and Greens',
      image: 'assets/images/5.png',
      gradient: [
        Color.fromARGB(255, 171, 253, 116),
        Color.fromARGB(255, 123, 211, 65),
      ],
      difficulty: RecipeDifficulty.easy,
      timeMin: 12,
      kcal: 210.0,
      persons: '1 person',
      description:
          'A healthy and nutritious combination of tender ribs with fresh, vibrant greens. Light yet satisfying for a quick meal.',
      ingredients: [
        '6 oz baby back ribs',
        '2 cups mixed greens',
        '1 tbsp balsamic vinegar',
        '1 tsp olive oil',
        '1/2 cup cherry tomatoes',
        'Salt and pepper to taste',
        'Fresh herbs for garnish',
      ],
      instructions: [
        'Season ribs with salt and pepper',
        'Grill or pan-sear ribs for 8-10 minutes, turning once',
        'While ribs cook, prepare salad with mixed greens and tomatoes',
        'Whisk together balsamic vinegar and olive oil for dressing',
        'Let ribs rest for 2 minutes, then slice',
        'Serve ribs over greens and drizzle with dressing',
        'Garnish with fresh herbs',
      ],
    ),

  
    _Recipe(
      title: 'Roasted Chicken',
      image: 'assets/images/7.png',
      gradient: [
        Color.fromARGB(255, 131, 96, 2),
        Color.fromARGB(255, 90, 66, 1),
      ],
      difficulty: RecipeDifficulty.hard,
      timeMin: 11,
      kcal: 110.0,
      persons: '1 person',
      description:
          'Perfectly roasted chicken with crispy skin and juicy meat. A classic comfort food that never goes out of style.',
      ingredients: [
        '1 small whole chicken (2-3 lbs)',
        '2 tbsp butter, softened',
        '1 tsp garlic powder',
        '1 tsp dried thyme',
        '1 tsp paprika',
        'Salt and black pepper',
        '1 lemon, quartered',
      ],
      instructions: [
        'Preheat oven to 425°F (220°C)',
        'Pat chicken dry and season inside and out with salt and pepper',
        'Mix butter with garlic powder, thyme, and paprika',
        'Rub butter mixture under and over the skin',
        'Stuff cavity with lemon quarters',
        'Roast for 45-60 minutes until internal temp reaches 165°F',
        'Let rest for 10 minutes before carving',
      ],
    ),
  
    _Recipe(
  title: 'Greek Salad',
  image: 'assets/images/9.png',
  gradient: [
    Color.fromARGB(255, 186, 85, 211),
    Color.fromARGB(255, 176, 10, 218) // Purple
     // Pink
  ],
  difficulty: RecipeDifficulty.easy,
  timeMin: 8,
  kcal: 180.0,
  persons: '2 person',
  description:
      'Fresh and vibrant Greek salad with crisp vegetables, tangy feta cheese, and aromatic herbs. A classic Mediterranean dish that\'s healthy and refreshing.',
  ingredients: [
    '2 large tomatoes, cut into wedges',
    '1 cucumber, sliced thick',
    '1/2 red onion, thinly sliced',
    '1/2 cup Kalamata olives',
    '4 oz feta cheese, crumbled',
    '3 tbsp extra virgin olive oil',
    '1 tbsp red wine vinegar',
    '1 tsp dried oregano',
    'Salt and black pepper to taste',
    'Fresh oregano for garnish',
  ],
  instructions: [
    'Cut tomatoes into wedges and place in a large bowl',
    'Add thick cucumber slices and thinly sliced red onion',
    'Add Kalamata olives to the bowl',
    'Crumble feta cheese over the vegetables',
    'Whisk together olive oil, red wine vinegar, and dried oregano',
    'Season dressing with salt and pepper to taste',
    'Pour dressing over salad and gently toss',
    'Let sit for 5 minutes to allow flavors to meld',
    'Garnish with fresh oregano and serve immediately',
  ],
),
_Recipe(
  title: 'Salmon Salad',
  image: 'assets/images/10.png',
  gradient: [
    Color.fromARGB(255, 147, 156, 14), // Light Salmon
     Color.fromARGB(255, 147, 156, 14),    // Deep Orange-Red
  ],
  difficulty: RecipeDifficulty.medium,
  timeMin: 15,
  kcal: 320.0,
  persons: '2 persons',
  description:
      'A refreshing salmon salad with tender grilled salmon, crisp greens, and a zesty lemon dressing. Perfect for a light yet satisfying meal.',
  ingredients: [
    '2 salmon fillets (about 4 oz each)',
    '4 cups mixed salad greens',
    '1 cup cherry tomatoes, halved',
    '1/2 cucumber, sliced',
    '1/4 red onion, thinly sliced',
    '1 avocado, sliced',
    '2 tbsp olive oil (for cooking salmon)',
    '1 tbsp lemon juice',
    '2 tbsp extra virgin olive oil (for dressing)',
    '1 tsp Dijon mustard',
    'Salt and black pepper to taste',
    'Fresh dill or parsley for garnish',
  ],
  instructions: [
    'Season salmon fillets with salt and black pepper',
    'Heat 2 tbsp olive oil in a pan and sear salmon for 3–4 minutes per side until cooked through',
    'Let salmon cool slightly, then flake into bite-sized pieces',
    'In a large bowl, combine salad greens, cherry tomatoes, cucumber, red onion, and avocado',
    'Whisk together lemon juice, extra virgin olive oil, Dijon mustard, salt, and pepper to make the dressing',
    'Pour dressing over the salad and toss gently',
    'Top salad with flaked salmon',
    'Garnish with fresh dill or parsley',
    'Serve immediately',
  ],
),

  ];

  // ---------- CONTROLLERS ----------
  late final AnimationController _introCtrl; // only for first time slide-in
  late final Animation<Offset> _introSlide;

  // New controllers for collapsing animation
  late final AnimationController _collapseCtrl;
  late final Animation<double> _collapseAnimation;
  late final Animation<Offset> _recipeSlideAnimation;

  late final PageController _pageCtrl;
  int _index = 0;
  bool _showRecipeDetail = false;
  int _detailRecipeIndex = 0; // Track which recipe's detail is shown

  @override
  void initState() {
    super.initState();

    // 1) Page controller
    _pageCtrl = PageController(initialPage: 0);

    // 2) First-time right->center slide-in for the whole image area
    _introCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _introSlide = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _introCtrl, curve: Curves.easeOut));

    // 3) Collapse animation controller
    _collapseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _collapseAnimation =
        Tween<double>(
          begin: 1.0,
          end: 0.3, // Collapse to 15% of original height
        ).animate(
          CurvedAnimation(parent: _collapseCtrl, curve: Curves.easeInOutCubic),
        );

    _recipeSlideAnimation =
        Tween<Offset>(
          begin: const Offset(0.0, 1.0), // Start from bottom
          end: Offset.zero, // End at normal position
        ).animate(
          CurvedAnimation(parent: _collapseCtrl, curve: Curves.easeOutBack),
        );

    // Start intro animation after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _introCtrl.forward();

      // (Optional) Precache to keep swipes smooth
      for (final r in recipes) {
        precacheImage(AssetImage(r.image), context);
      }
    });
  }

  @override
  void dispose() {
    _introCtrl.dispose();
    _collapseCtrl.dispose();
    _pageCtrl.dispose();
    super.dispose();
  }

  void _toggleRecipeDetail() {
    if (!_showRecipeDetail) {
      // Opening detail view - record current recipe
      _detailRecipeIndex = _index;
    }

    setState(() {
      _showRecipeDetail = !_showRecipeDetail;
    });

    if (_showRecipeDetail) {
      _collapseCtrl.forward();
    } else {
      _collapseCtrl.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final current = recipes[_index];

    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Column(
            children: [
              // --------- HEADER / HERO AREA ---------
              Stack(
                children: [
                  // Background gradient that animates when _index changes
                  AnimatedBuilder(
                    animation: _collapseAnimation,
                    builder: (context, child) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOutCubic,
                        height: context.height(0.6) * _collapseAnimation.value,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                            colors: current.gradient,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(300),
                            bottomRight: Radius.circular(300),
                          ),
                        ),
                      );
                    },
                  ),

                  // Foreground content
                  AnimatedBuilder(
                    animation: _collapseAnimation,
                    builder: (context, child) {
                      return Column(
                        children: [
                          // Pass current recipe data to AppBar
                          MyAppbar(
                            difficulty: current.difficulty,
                            accentColor: current.gradient.last,
                            onStarPressed: _toggleRecipeDetail,
                          ),
                          SizedBox(
                            height:
                                context.height(0.05) * _collapseAnimation.value,
                          ),

                          // Enhanced title animation - pure fade with subtle scale
                          if (_collapseAnimation.value > 0.3)
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              switchInCurve: Curves.easeInOut,
                              switchOutCurve: Curves.easeInOut,
                              transitionBuilder: (child, animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: ScaleTransition(
                                    scale: Tween<double>(
                                      begin: 0.9,
                                      end: 1.0,
                                    ).animate(animation),
                                    child: child,
                                  ),
                                );
                              },
                              child: Opacity(
                                opacity: (_collapseAnimation.value - 0.3) / 0.7,
                                child: Text(
                                  current.title,
                                  key: ValueKey(current.title),
                                  style: AppTextStyles.jayabaru.copyWith(
                                    fontSize: context.responsiveFont(32 ),
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      250,
                                      242,
                                    ),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),

                          SizedBox(
                            height:
                                context.height(0.04) * _collapseAnimation.value,
                          ),

                          // IMAGE AREA: intro SlideTransition (first mount) + PageView for swipes
                          Center(
                            child: AnimatedBuilder(
                              animation: _collapseAnimation,
                              builder: (context, child) {
                                return SizedBox(
                                  height:
                                      context.height(0.3) *
                                      _collapseAnimation.value,
                                  child: Opacity(
                                    opacity: _collapseAnimation.value > 0.2
                                        ? 1.0
                                        : 0.0,
                                    child: SlideTransition(
                                      position: _introSlide,
                                      child: PageView.builder(
                                        controller: _pageCtrl,
                                        physics: _collapseAnimation.value > 0.2
                                            ? const BouncingScrollPhysics()
                                            : const NeverScrollableScrollPhysics(),
                                        itemCount: recipes.length,
                                        onPageChanged: (i) {
                                          setState(() => _index = i);
                                        },
                                        itemBuilder: (context, i) {
                                          return AnimatedScale(
                                            duration: const Duration(
                                              milliseconds: 300,
                                            ),
                                            curve: Curves.easeInOut,
                                            scale: i == _index ? 1.0 : 0.94,
                                            child: AnimatedOpacity(
                                              duration: const Duration(
                                                milliseconds: 200,
                                              ),
                                              opacity: i == _index ? 1.0 : 0.7,
                                              child: Image.asset(
                                                recipes[i].image,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),

              // --------- DETAILS AREA ---------
              if (!_showRecipeDetail) ...[
                SizedBox(height: context.height(0.05)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      // Time (bind with current) with enhanced animation
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        switchInCurve: Curves.easeInOut,
                        switchOutCurve: Curves.easeInOut,
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: SizedBox(
                          width: context.width(
                            0.7,
                          ), // Fixed width to prevent shifting
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              '${current.timeMin} Min',
                              key: ValueKey('${current.timeMin}'),
                              // textAlign: TextAlign
                              //     .left, // or TextAlign.center if you prefer centered
                              style: AppTextStyles.jayabaru.copyWith(
                                fontSize: context.responsiveFont(55),
                                color: textColor,
                                fontWeight: FontWeight.w600,
                                
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: context.height(0.12),
                        width: context.width(0.13),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                            255,
                            179,
                            178,
                            178,
                          ).withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.thumb_up_outlined),
                            ),
                            IconButton(
                              onPressed: _toggleRecipeDetail,
                              icon: Icon(
                                _showRecipeDetail
                                    ? Icons.star
                                    : Icons.star_border,
                                color: _showRecipeDetail ? Colors.amber : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: context.height(0.02)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _pill('${current.kcal.toStringAsFixed(1)} Kcal', context),
                      _pill(current.persons, context),
                    ],
                  ),
                ),
              ],
            ],
          ),

          // Recipe detail overlay that slides up from bottom
          if (_showRecipeDetail)
            SlideTransition(
              position: _recipeSlideAnimation,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: context.height(0.75),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 20,
                        offset: Offset(0, -5),
                      ),
                    ],
                  ),
                  child: RecipeDetailView(
                    recipe:
                        recipes[_detailRecipeIndex], // Use the preserved detail recipe
                    onClose: _toggleRecipeDetail,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _pill(String text, BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(animation),
            child: child,
          ),
        );
      },
      child: Container(
        key: ValueKey(text),
        height: context.height(0.055),
        width: context.width(0.4),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(width: 2),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.manropeNormal.copyWith(
              fontSize: context.responsiveFont(20),
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

// Recipe Detail View Widget
class RecipeDetailView extends StatelessWidget {
  final _Recipe recipe;
  final VoidCallback onClose;

  const RecipeDetailView({
    super.key,
    required this.recipe,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Handle bar at top
        Container(
          margin: const EdgeInsets.only(top: 12),
          width: 50,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        // Header with close button
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  recipe.title,
                  style: AppTextStyles.jayabaru.copyWith(
                    fontSize: context.responsiveFont(28),
                    color: textColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              IconButton(
                onPressed: onClose,
                icon: const Icon(Icons.close, size: 28),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  shape: const CircleBorder(),
                ),
              ),
            ],
          ),
        ),

        // Content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Quick stats row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatChip('${recipe.timeMin} Min', Icons.timer),
                    _buildStatChip(
                      '${recipe.kcal.toStringAsFixed(0)} Cal',
                      Icons.local_fire_department,
                    ),
                    _buildStatChip(recipe.persons, Icons.person),
                  ],
                ),

                const SizedBox(height: 24),

                // Description
                Text(
                  'About This Recipe',
                  style: AppTextStyles.jayabaru.copyWith(
                    fontSize: context.responsiveFont(20),
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  recipe.description,
                  style: AppTextStyles.manropeNormal.copyWith(
                    fontSize: context.responsiveFont(16),
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 24),

                // Ingredients
                Text(
                  'Ingredients',
                  style: AppTextStyles.jayabaru.copyWith(
                    fontSize: context.responsiveFont(20),
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                ...recipe.ingredients.map(
                  (ingredient) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 8, right: 12),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: recipe.gradient.last,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            ingredient,
                            style: AppTextStyles.manropeNormal.copyWith(
                              fontSize: context.responsiveFont(16),
                              color: textColor,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Instructions
                Text(
                  'Instructions',
                  style: AppTextStyles.jayabaru.copyWith(
                    fontSize: context.responsiveFont(20),
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                ...recipe.instructions.asMap().entries.map((entry) {
                  final index = entry.key;
                  final instruction = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 2, right: 12),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: recipe.gradient.last,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            instruction,
                            style: AppTextStyles.manropeNormal.copyWith(
                              fontSize: context.responsiveFont(16),
                              color: textColor,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                const SizedBox(height: 100), // Extra padding for bottom
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatChip(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: recipe.gradient.last),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}

// Enum for recipe difficulty levels
enum RecipeDifficulty { easy, medium, hard }

// Enhanced Recipe data model
class _Recipe {
  final String title;
  final String image;
  final List<Color> gradient;
  final RecipeDifficulty difficulty;
  final int timeMin;
  final double kcal;
  final String persons;
  final String description;
  final List<String> ingredients;
  final List<String> instructions;

  const _Recipe({
    required this.title,
    required this.image,
    required this.gradient,
    required this.difficulty,
    required this.timeMin,
    required this.kcal,
    required this.persons,
    required this.description,
    required this.ingredients,
    required this.instructions,
  });
}

// Updated MyAppbar widget with star callback
class MyAppbar extends StatefulWidget {
  final RecipeDifficulty difficulty;
  final Color accentColor;
  final VoidCallback onStarPressed;

  const MyAppbar({
    super.key,
    required this.difficulty,
    required this.accentColor,
    required this.onStarPressed,
  });

  @override
  State<MyAppbar> createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  String get difficultyText {
    switch (widget.difficulty) {
      case RecipeDifficulty.easy:
        return "EASY";
      case RecipeDifficulty.medium:
        return "MEDIUM";
      case RecipeDifficulty.hard:
        return "HARD";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios_outlined,
              size: 40,
              color: whiteColor,
            ),
            const Spacer(),

            // Video camera icon container with animated color
            AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOutCubic,
              height: context.height(0.043),
              width: context.width(0.14),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: Icon(
                  Icons.video_camera_back_outlined,
                  key: ValueKey(widget.accentColor),
                  color: widget.accentColor,
                  size: 30,
                ),
              ),
            ),

            const SizedBox(width: 8),

            // Difficulty text container with animated color and text
            AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOutCubic,
              height: context.height(0.043),
              width: context.width(0.25),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: Tween<double>(
                          begin: 0.9,
                          end: 1.0,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: Text(
                    difficultyText,
                    key: ValueKey(difficultyText),
                    style: AppTextStyles.jayabaru.copyWith(
                      fontSize: context.responsiveFont(16),
                      color: widget.accentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
