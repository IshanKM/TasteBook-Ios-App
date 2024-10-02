import SwiftUI

struct Homepage: View {
    @State private var searchText = ""
    
    // Sample data
    let trendingRecipes = [
        Recipe(name: "Green Beans with a Mountain of Panko", imageName: "Green_beans", cookTime: 30, rating: 4.5, reviews: 120 , calories: 750),
        Recipe(name: "Green Bean Casserole", imageName: "Tranding2", cookTime: 45, rating: 4.2, reviews: 85 , calories: 550)
    ]

    let recommendedRecipes = [
        Recipe(name: "Creamy Mashed Potatoes", imageName: "recommand1", cookTime: 40, rating: 4.8, reviews: 200, calories: 400),
        Recipe(name: "Crispy Panko Chicken", imageName: "recommand2", cookTime: 35, rating: 4.6, reviews: 150 , calories: 350)
    ]

    let popularRecipes = [
        Recipe(name: "Poached Eggs", imageName: "poachedEggs", cookTime: 15, rating: 4.3, reviews: 98, calories: 520),
        Recipe(name: "Heinz baked beans", imageName: "heinzBaked", cookTime: 10, rating: 4.0, reviews: 110, calories: 1100),
        Recipe(name: "Scrambled Eggs", imageName: "scrambledEggs", cookTime: 20, rating: 4.6, reviews: 210, calories: 254),
        Recipe(name: "Fluffy Egg White Omelette", imageName: "fluffyEgg", cookTime: 25, rating: 4.4, reviews: 132, calories: 700)
    ]

    let recentRecipes = [
        Recipe(name: "Poached Eggs", imageName: "poachedEggs", cookTime: 15, rating: 4.3, reviews: 98, calories: 470),
        Recipe(name: "Gochujang Chicken Burgers", imageName: "recent02", cookTime: 30, rating: 4.7, reviews: 175, calories: 210)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Find Best Recipes\nfor cooking")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                        Image("TasteBookLogo")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    
                    Text("Good Morning !")
                        .font(.headline)
                        .foregroundColor(.orange)
                    
                    SearchBar(text: $searchText)
                    
                    RecipeSection(title: "Trending recipes 🔥", recipes: trendingRecipes)
                    
                    RecipeSection(title: "Recommended for you ❤️", recipes: recommendedRecipes)
                    
                    CategorySection()
                    
                    RecipeList(title: "", recipes: popularRecipes)
                    
                    MealPlanningCard()
                    
                    RecipeSection(title: "Recent recipes", recipes: recentRecipes)
                    
                    PopularChefSection()
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
        BottomNavBar()
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search", text: $text)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct RecipeSection: View {
    
    let title: String
    let recipes: [Recipe]
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Button("See All") {
                    // Action
                }
                .foregroundColor(.orange)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 50) {
                    ForEach(recipes) { recipe in
                        RecipeCard(recipe: recipe)
                            .frame(width: 250)
                    }
                }
            }
        }
    }
}

struct RecipeCard: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(recipe.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .cornerRadius(10)
            Text(recipe.name)
                .font(.headline)
            HStack {
                Image(systemName: "clock")
                Text("\(recipe.cookTime) mins")
                Image(systemName: "flame.fill")
                Text("\(recipe.calories)")
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text(String(format: "%.1f", recipe.rating))
            }
            .font(.caption)
            .foregroundColor(.gray)
        }
    }
}



struct CategorySection: View {
    var body: some View {
        Spacer()
        VStack(alignment: .leading) {
            Text("Popular Category")
                .font(.title2)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    CategoryButton(icon: "🍳", name: "Breakfast")
                    CategoryButton(icon: "🍕", name: "Fast Food")
                    CategoryButton(icon: "🥗", name: "Healthy")
                    CategoryButton(icon: "🍤", name: "Seafood")
                    CategoryButton(icon: "🍜", name: "Asian")
                    CategoryButton(icon: "🥬", name: "Vegan")
                    CategoryButton(icon: "🍰", name: "Dessert")
                }
            }
        }
    }
}

struct CategoryButton: View {
    let icon: String
    let name: String
    
    var body: some View {
        VStack {
            Text(icon)
                .font(.system(size: 30))
                .frame(width: 60, height: 60)
                .background(Color.orange.opacity(0.2))
                .cornerRadius(30)
            Text(name)
                .font(.caption)
        }
    }
}

struct RecipeList: View {
    let title: String
    let recipes: [Recipe]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Button("See All") {
                    // Action
                }
                .foregroundColor(.orange)
            }
            ForEach(recipes) { recipe in
                HStack {
                    Image(recipe.imageName)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                    VStack(alignment: .leading) {
                        Text(recipe.name)
                            .font(.headline)
                        Text("\(recipe.cookTime) mins")
                            .font(.caption)
                            .foregroundColor(.gray)
                        HStack {
                            Image(systemName: "flame.fill")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text("\(recipe.calories)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                    }
                    Spacer()
                    VStack {
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(String(format: "%.1f", recipe.rating))
                        }
                        Text("\(recipe.reviews) reviews")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}

struct MealPlanningCard: View {
    var body: some View {
        Spacer()
        VStack(alignment: .center, spacing: 10) {
            
            Image("mealPlan")
                .resizable()
                .frame(width: 120, height: 150)
                .offset(y: -20)
            
            Spacer()
            
            Text("Meal planning made easy")
                .font(.headline)
            
            Text("Add recommended recipes, instantly create shopping list, schedule meals and get cooking reminders")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
            
            Button("Start Planning") {
                // Action here
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color(hex: "#FBBC05"), Color(hex: "#E75B24"), Color(hex: "#E75B24")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .opacity(0.2)
        )
        .cornerRadius(15)
    }
}


struct PopularChefSection: View {
    var body: some View {
        Spacer()
        VStack(alignment: .leading) {
            HStack {
                Text("Popular chef")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Button("See All") {
                    // Action
                }
                .foregroundColor(.orange)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ChefCard(name: "Ishan KM", imageName: "ishan")
                    ChefCard(name: "Sadul", imageName: "sadul")
                    ChefCard(name: "Heshani", imageName: "heshani")
                }
            }
            Spacer()
        }
    }
}

struct ChefCard: View {
    let name: String
    let imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            Text(name)
                .font(.caption)
        }
    }
}

struct BottomNavBar: View {
    var body: some View {
        HStack {
            NavBarButton(icon: "house.fill", text: "Home")
                .frame(maxWidth: .infinity)
            NavBarButton(icon: "heart", text: "Favorites")
                .frame(maxWidth: .infinity)
            NavBarButton(icon: "plus.circle.fill", text: "")
                .offset(y: -20)
                .frame(maxWidth: .infinity)
            NavBarButton(icon: "book", text: "Recipes")
                .frame(maxWidth: .infinity)
            NavBarButton(icon: "person", text: "Profile")
                .frame(maxWidth: .infinity)
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.bottom) // Ensures it's not clipped off-screen
        .edgesIgnoringSafeArea(.bottom) // Ensures the navbar is attached to the bottom
    }
}


struct NavBarButton: View {
    let icon: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundColor(icon == "plus.circle.fill" ? .orange : .gray)
                .font(.system(size: icon == "plus.circle.fill" ? 40 : 20))
            if !text.isEmpty {
                Text(text)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let cookTime: Int
    let rating: Double
    let reviews: Int
    let calories : Int
}



struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
