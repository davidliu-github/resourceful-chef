CREATE DATABASE  IF NOT EXISTS `recipe` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipe`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: recipe
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `calories` int DEFAULT NULL,
  `unitID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ingredient_unit_fk` (`unitID`),
  CONSTRAINT `ingredient_unit_fk` FOREIGN KEY (`unitID`) REFERENCES `unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'bread',79,4),(2,'cheddar cheese',113,4),(3,'ground beef',1506,5),(4,'onion',44,8),(5,'garlic',4,7),(6,'olive oil',119,3),(7,'crushed tomato',60,1),(8,'red pepper flakes',14,3),(9,'balsamic vinegar',14,3),(10,'dried oregano',3,2),(11,'dried spaghetti',221,1),(12,'salt',0,2),(13,'ground black pepper',6,2),(15,'butter',102,3),(16,'boneless chicken breast',335,1),(17,'egg',78,10),(18,'grated parmesan cheese',22,3),(19,'all-purpose flour',455,1),(20,'mozzarella cheese',336,1),(21,'tomato sauce',70,1),(22,'basil',1,3),(23,'provolone cheese',464,1),(24,'pesto',65,3),(25,'broccoli',45,8),(26,'carrot',30,8),(27,'milk',103,1),(28,'panko breadcrumbs',107,1),(29,'eggplant',136,10),(30,'cucumber',30,8),(31,'macaroni pasta',390,1),(32,'mayonnaise',94,3),(33,'white vinegar',0,3),(34,'white sugar',20,2),(35,'prepared mustard',3,2),(36,'celery',10,8),(37,'paprika',19,3),(38,'water',0,1),(39,'yeast',20,6),(40,'sweet italian sausage',42,6),(41,'tomato paste',139,9),(42,'italian seasoning',15,3),(43,'parsley',1,3),(44,'lasagna noodle',86,NULL),(45,'ricotta cheese',428,1),(46,'parmesan cheese',22,3),(47,'vanilla extract',38,3),(48,'ground cinnamon',17,3),(49,'baking powder',2,2),(50,'chicken stock',86,1),(51,'bay leaves',6,3),(52,'bone-in chicken breast',335,1),(53,'wide egg noodle',221,1),(54,'dill',4,1),(55,'lemon juice',53,1),(56,'linguine',220,1),(57,'large shrimp',9,NULL),(58,'dry white wine',24,6),(59,'gold potato',110,8),(60,'green onion',5,8),(61,'baking potato',161,8),(62,'brown sugar',17,2),(63,'garlic powder',32,3),(64,'frozen peas',118,1),(65,'white rice',206,1),(66,'soy sauce',9,3),(67,'oyster sauce',9,3),(68,'toasted sesame oil',120,3),(69,'hamburger bun',79,6),(70,'tomato',33,10),(71,'green leaf lettuce',5,1),(72,'red onion',48,1),(73,'dill pickle slice',1,NULL),(74,'chili powder',22,3),(75,'ground cumin',0,3),(76,'ground cayenne pepper',0,3),(77,'beef broth',31,1),(78,'canned diced tomatoes',78,1),(79,'red kidney bean',613,1);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_inventory`
--

DROP TABLE IF EXISTS `ingredient_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient_inventory` (
  `userID` int NOT NULL,
  `ingredientID` int NOT NULL,
  PRIMARY KEY (`userID`,`ingredientID`),
  KEY `iinventory_ingredient_fk` (`ingredientID`),
  CONSTRAINT `iinventory_ingredient_fk` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `iinventory_user_fk` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_inventory`
--

LOCK TABLES `ingredient_inventory` WRITE;
/*!40000 ALTER TABLE `ingredient_inventory` DISABLE KEYS */;
INSERT INTO `ingredient_inventory` VALUES (1,15);
/*!40000 ALTER TABLE `ingredient_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `time` int NOT NULL,
  `servings` int NOT NULL,
  `instructions` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'Grilled Cheese Sandwich',20,2,'(1) Preheat skillet over medium heat. Generously butter one side of a slice of bread. Place bread butter-side-down onto skillet bottom and add 1 slice of cheese. Butter a second slice of bread on one side and place butter-side-up on top of sandwich. Grill until lightly browned and flip over; continue grilling until cheese is melted. Repeat with remaining 2 slices of bread, butter and slice of cheese. \n(2)Carefully pour in 1 (28-ounce) can crushed tomatoes and season with the remaining 1/2 teaspoon kosher salt. Bring to a boil. Reduce the heat to medium-low and gently simmer uncovered until the sauce is slightly thickened, about 20 minutes. \n(3) Meanwhile, bring a large pot of salted water to a boil. Add 1 pound dried spaghetti and cook for 1 minute less than the package instructions for al dente, about 9 minutes. Reserve 1 cup of the pasta cooking water and drain the spaghetti. \n(4)Return the pasta to the pot. Add the sauce, reserved pasta cooking water, and 2 teaspoons balsamic vinegar, and toss to combine. Bring to a simmer over medium heat, tossing continuously, until the sauce coats the pasta and everything is evenly combined, 1 to 2 minutes. Serve in bowls topped with lots of grated Parmesan cheese.'),(2,'Spaghetti with Meat Sauce',35,5,'(1) Preheat skillet over medium heat. Generously butter one side of a slice of bread. Place bread butter-side-down onto skillet bottom and add 1 slice of cheese. Butter a second slice of bread on one side and place butter-side-up on top of sandwich. Grill until lightly browned and flip over; continue grilling until cheese is melted. Repeat with remaining 2 slices of bread, butter and slice of cheese. \n(2)Carefully pour in 1 (28-ounce) can crushed tomatoes and season with the remaining 1/2 teaspoon kosher salt. Bring to a boil. Reduce the heat to medium-low and gently simmer uncovered until the sauce is slightly thickened, about 20 minutes. \n(3) Meanwhile, bring a large pot of salted water to a boil. Add 1 pound dried spaghetti and cook for 1 minute less than the package instructions for al dente, about 9 minutes. Reserve 1 cup of the pasta cooking water and drain the spaghetti. \n(4)Return the pasta to the pot. Add the sauce, reserved pasta cooking water, and 2 teaspoons balsamic vinegar, and toss to combine. Bring to a simmer over medium heat, tossing continuously, until the sauce coats the pasta and everything is evenly combined, 1 to 2 minutes. Serve in bowls topped with lots of grated Parmesan cheese.'),(3,'Chicken Parmesan',45,4,'(1) Preheat an oven to 450 degrees F (230 degrees C).\n(2) Place chicken breasts between two sheets of heavy plastic (resealable freezer bags work well) on a solid, level surface. Firmly pound chicken with the smooth side of a meat mallet to a thickness of 1/2-inch. Season chicken thoroughly with salt and pepper.\n(3) Beat eggs in a shallow bowl and set aside.\n(4) Mix bread crumbs and 1/2 cup Parmesan cheese in a separate bowl, set aside.\n(5) Place flour in a sifter or strainer; sprinkle over chicken breasts, evenly coating both sides.\n(6) Dip a flour-coated chicken breast in beaten eggs. Transfer breast to the bread crumb mixture, pressing crumbs into both sides. Repeat for each breast. Let chicken rest for 10 to 15 minutes.\n(7) Heat 1/2 inch olive oil in a large skillet on medium-high heat until it begins to shimmer. Cook chicken in the hot oil until golden, about 2 minutes per side. The chicken will finish cooking in the oven.\n(8) Transfer chicken to a baking dish. Top each breast with 2 tablespoons tomato sauce. Layer each chicken breast with equal amounts of mozzarella cheese, fresh basil, and provolone cheese. Sprinkle remaining Parmesan over top and drizzle each with 1/2 teaspoon olive oil.\n(9) Bake in the preheated oven until cheese is browned and bubbly and chicken breasts are no longer pink in the center, 15 to 20 minutes. An instant-read thermometer inserted into the center should read at least 165 degrees F (74 degrees C). '),(4,'Pesto Pasta',15,8,'(1) Cook pasta in a large pot of boiling water until done. Drain.\n(2) Meanwhile, heat the oil in a frying pan over medium low heat. Add pesto, onion, and salt and pepper. Cook about five minutes, or until onions are soft.\n(3) In a large bowl, mix pesto mixture into pasta. Stir in grated cheese. Serve.'),(5,'Scrambled Eggs',15,2,'(1) Melt the butter in a medium non-stick pan over medium-low heat.\n(2) Crack eggs into a bowl, add a pinch of salt and whisk until well blended.\n(3)When the butter begins to bubble, pour in the eggs and immediately use a silicone spatula to swirl in small circles around the pan, without stopping, until the eggs look slightly thickened and very small curds begin to form, about 30 seconds.\n(4)Change from making circles to making long sweeps across the pan until you see larger, creamy curds; about 20 seconds.\n(5)When the eggs are softly set and slightly runny in places, remove the pan from the heat and leave for a few seconds to finish cooking. Give a final stir and serve immediately. Serve with an extra sprinkle of salt, a grind of black pepper and a few fresh chopped herbs (if desired).'),(6,'Cucumber Sandwiches',40,4,'(1) Line a baking sheet with paper towels and spread the cucumbers on top. Sprinkle lightly with salt and leave for 20 minutes. Pat them dry with more paper towels. Taste the slices, and sprinkle with more salt if they taste bland.\n(2)Set bread slices on a cutting board and spread one side of each slice generously with butter or cream cheese. You will need about 1-2 teaspoons per slice depending on the size of your bread slices.\n(3)Overlapping them to cover the bread, lay the cucumbers on half of the bread slices. If the cucumbers are very thin, make 2 layers, if thick, make one. The cucumber filling should be about 1/4-inch thick. Sprinkle the cucumber slices with pepper. If you like, top the cucumbers with one of the optional ingredients. Top with a second slice of bread.\n(4)Pressing down firmly, cut the crusts off, and then cut into rectangles, triangles, or quarters. Keep it neat!\n(5)Arrange on platters (or your plate) and serve.'),(7,'Deviled Eggs',15,2,'(1) Slice eggs in half lengthwise and remove yolks; set whites aside. Mash yolks with a fork in a small bowl. Stir in mayonnaise, sugar, vinegar, mustard, salt, finely chopped onion, and finely chopped celery; mix well. Stuff or pipe egg yolk mixture into egg whites. Sprinkle with paprika. Refrigerate until serving.'),(8,'Dinner Rolls',85,12,'(1) Combine 3/4 cup flour, sugar, undissolved yeast, and salt in a large bowl.\n(2) Heat milk, water, and 2 tablespoons butter in a saucepan until very warm (120 degrees to 130 degrees F).\n(3) Add warm milk mixture to the flour mixture. Beat for 2 minutes on medium speed of an electric mixer, scraping the bowl occasionally. Add 1/4 cup flour; beat for 2 minutes at high speed. Stir in enough remaining flour to make soft dough.\n(4) Knead dough on a lightly floured surface until smooth and elastic, about 8 to 10 minutes. Cover; let rest for 10 minutes.\n(5) Divide dough into 12 equal pieces. Shape pieces into balls and place in a greased 8-inch round pan. Cover and let rise in warm, draft-free place until doubled in size, about 30 minutes.\n(6) Preheat the oven to 375 degrees F (190 degrees C).\n(7) Bake rolls in the preheated oven until golden brown on top, about 20 minutes. Serve warm.'),(9,'Lasagna',150,12,'(1) In a Dutch oven, cook sausage, ground beef, onion, and garlic over medium heat until well browned. Stir in crushed tomatoes, tomato paste, tomato sauce, and water. Season with sugar, basil, fennel seeds, Italian seasoning, 1 teaspoon salt, pepper, and 2 tablespoons parsley. Simmer, covered, for about 1 1/2 hours, stirring occasionally.\n(2) Bring a large pot of lightly salted water to a boil. Cook lasagna noodles in boiling water for 8 to 10 minutes. Drain noodles, and rinse with cold water. In a mixing bowl, combine ricotta cheese with egg, remaining parsley, and 1/2 teaspoon salt.\n(3) Preheat oven to 375 degrees F (190 degrees C).\n(4) To assemble, spread 1 1/2 cups of meat sauce in the bottom of a 9x13-inch baking dish. Arrange 6 noodles lengthwise over meat sauce. Spread with one half of the ricotta cheese mixture. Top with a third of mozzarella cheese slices. Spoon 1 1/2 cups meat sauce over mozzarella, and sprinkle with 1/4 cup Parmesan cheese. Repeat layers, and top with remaining mozzarella and Parmesan cheese. Cover with foil: to prevent sticking, either spray foil with cooking spray, or make sure the foil does not touch the cheese.\n(5) Bake in preheated oven for 25 minutes. Remove foil, and bake an additional 25 minutes. Cool for 15 minutes before serving.'),(10,'French Toast',15,3,'(1) Whisk milk, eggs, vanilla, cinnamon, and salt together in a shallow bowl.\n(2) Lightly butter a griddle and heat over medium-high heat.\n(3) Dunk bread in the egg mixture, soaking both sides. Transfer to the hot skillet and cook until golden, 3 to 4 minutes per side. Serve hot.'),(11,'Pancakes',20,8,'(1) In a large bowl, sift together the flour, baking powder, salt and sugar. Make a well in the center and pour in the milk, egg and melted butter; mix until smooth..\n(2) Heat a lightly oiled griddle or frying pan over medium-high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'),(12,'Chicken Noodle Soup',70,6,'(1) Melt butter in a large stockpot or Dutch oven over medium heat. Add onion, carrots and celery. Cook, stirring occasionally, until tender, about 3-4 minutes. Stir in garlic until fragrant, about 1 minute.\n(2) Stir in chicken stock and bay leaves; season with salt and pepper, to taste. Add chicken and bring to boil; reduce heat and simmer, covered, until the chicken is cooked through, about 30-40 minutes. Remove chicken and let cool before dicing into bite-size pieces, discarding bones.\n(3) Stir in chicken and pasta and cook until tender, about 6-7 minutes.\n(4) Remove from heat; stir in parsley, dill and lemon juice; season with salt and pepper, to taste.\n(5) Serve immediately.'),(13,'Shrimp Scampi',30,4,'(1) Bring a large pot of salted water to a boil. Add the linguine and cook as the label directs. Reserve 1 cup cooking water, then drain.\n(2) Meanwhile, season the shrimp with salt. Heat the olive oil in a large skillet over medium-high heat. Add the garlic and red pepper flakes and cook until the garlic is just golden, 30 seconds to 1 minute. Add the shrimp and cook, stirring occasionally, until pink and just cooked through, 1 to 2 minutes per side. Remove the shrimp to a plate. Add the wine and lemon juice to the skillet and simmer until slightly reduced, 2 minutes. \n(3) Return the shrimp and any juices from the plate to the skillet along with the linguine, butter and 1/2 cup of the reserved cooking water. Continue to cook, tossing, until the butter is melted and the shrimp is hot, about 2 minutes, adding more of the reserved cooking water as needed. Season with salt; stir in the parsley. Serve with lemon wedges.'),(14,'Potato Salad',40,8,'(1) Add the potatoes to a large pot of cold water and bring to a boil. Reduce the heat to a lightly rolling boil over medium heat and add 1 teaspoon of kosher salt. Cook for 20-25 minutes or until the potatoes are easily pierced with a fork or paring knife. Drain and set aside until cool enough to handle.\n(2) Peel the skins from the potatoes and cut into 1/2 inch to 3/4 inch square pieces. Transfer the warm potatoes to a large mixing bowl and sprinkle with the white vinegar. Toss the potatoes with the vinegar and set the potatoes aside to cool, about 15-20 minutes.\n(3) Add the celery and the green onions to the potato mixture. Chop 4 of the hard boiled eggs and add to the potato mixture.\n(4) In a medium bowl, mix the Miracle Whip or mayonnaise, yellow mustard, celery seed and salt and pepper. Fold into the potato mixture and season with more salt and pepper to taste. Slice the last egg into thin slices and place the slices on top of the salad. Sprinkle with paprika if desired. Chill for at least 1 hour or overnight before serving.'),(15,'Mashed Potato',35,4,'(1) Bring a pot of salted water to a boil. Add potatoes and cook until tender but still firm, about 15 minutes; drain.\n(2) In a small saucepan heat butter and milk over low heat until butter is melted. Using a potato masher or electric beater, slowly blend milk mixture into potatoes until smooth and creamy. Season with salt and pepper to taste.'),(16,'Oven Baked Chicken Breast',23,4,'(1) Preheat oven to 425°F/220°C (200°C fan).\n(2) Pound chicken to 1.5cm / 0.6 inch at the thickest part - using a rolling pin, meat mallet or even your fist (key tip for even cooking + tender chicken).\n(3) Mix Seasoning.\n(4) Line tray with foil and baking / parchment paper. Place chicken upside down on tray. Drizzle chicken with about 1 tsp oil. Rub over with fingers. Sprinkle with Seasoning.\n(5) Flip chicken. Drizzle with 1 tsp oil, rub with fingers, sprinkle with Seasoning, covering as much of the surface area as you can.\n(6) Bake 18 minutes, or until surface is golden per photos and video, or internal temperature is 165°F/75°C using a meat thermometer.\n(7) Remove from oven and immediately transfer chicken to serving plates.\n(8) Wait 3 - 5 minutes before serving, garnished with freshly chopped parsley if desired.'),(17,'Fried Rice',15,5,'(1) Heat 1/2 tablespoon of butter in a large sauté pan* over medium-high heat until melted. Add egg, and cook until scrambled, stirring occasionally. Remove egg, and transfer to a separate plate.\n(2) Add an additional 1 tablespoon butter to the pan and heat until melted. Add carrots, onion, peas and garlic, and season with a generous pinch of salt and pepper. Sauté for about 5 minutes or until the onion and carrots are soft. Increase heat to high, add in the remaining 1 1/2 tablespoons of butter, and stir until melted. Immediately add the rice, green onions, soy sauce and oyster sauce (if using), and stir until combined. Continue sautéing for an additional 3 minutes to fry the rice, stirring occasionally.  (I like to let the rice rest for a bit between stirs so that it can crisp up on the bottom.)  Then add in the eggs and stir to combine. Remove from heat, and stir in the sesame oil until combined.  Taste and season with extra soy sauce, if needed.\n(3) Serve immediately, or refrigerate in a sealed container for up to 3 days.'),(18,'Burger',30,4,'(1) Slice, and prepare all of your burger toppings and sauces.\n(2) Spread the cut-side of the bun with softened or melted butter and toast the cut side on a skillet or on the grill until golden brown. You can toast the bun ahead or in the last couple of minutes with the burgers on the grill.  Toasting the bun adds great flavor and prevents a soggy bun.\n(3) Preheat grill to medium heat. Divide beef into 4 portions and form patties that are about 1/2 an inch thick and 1 inch wider than the burger buns. Season patties generously with salt and pepper. \n(4) Grill burger patties (indent-side-up) covered for 3-5 min each side on the grill. Flip burgers when juices are accumulating on top of burger and you have a good sear. Apply cheese in the last 1-2 minutes of grilling then cover with lid and cook until internal temperature of beef reaches 160˚F.'),(19,'Chili',30,6,'(1) Add the olive oil to a large soup pot and place it over medium-high heat for two minutes. Add the onion. Cook for 5 minutes, stirring occasionally.\n(2) Add the ground beef to the pot. Break it apart with a wooden spoon. Cook for 6-7 minutes, until the beef is browned, stirring occasionally.\n(3) Add the chili powder, cumin, sugar, tomato paste, garlic powder, salt, pepper, and optional cayenne. Stir until well combined.\n(4) Add the broth, diced tomatoes (with their juice), drained beans, and tomato sauce. Stir well.\n(5) Bring the liquid to a low boil. Then, reduce the heat (low to medium-low) to gently simmer the chili, uncovered, for 20-25 minutes, stirring occasionally.\n(6) Remove the pot from the heat. Let the chili rest for 5-10 minutes before serving.');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredient`
--

DROP TABLE IF EXISTS `recipe_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_ingredient` (
  `recipeID` int NOT NULL,
  `ingredientID` int NOT NULL,
  `count` double DEFAULT NULL,
  `unitID` int DEFAULT NULL,
  PRIMARY KEY (`recipeID`,`ingredientID`),
  KEY `inventory_ingredient_fk` (`ingredientID`),
  KEY `inventory_unit_fk` (`unitID`),
  CONSTRAINT `inventory_ingredient_fk` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_recipe_fk` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_unit_fk` FOREIGN KEY (`unitID`) REFERENCES `unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredient`
--

LOCK TABLES `recipe_ingredient` WRITE;
/*!40000 ALTER TABLE `recipe_ingredient` DISABLE KEYS */;
INSERT INTO `recipe_ingredient` VALUES (1,1,4,4),(1,2,2,4),(1,15,3,3),(2,3,1,5),(2,4,2,8),(2,5,3,7),(2,6,1,3),(2,7,1,9),(2,8,0,2),(2,9,2,2),(2,10,1,2),(2,11,1,5),(2,12,2,2),(2,13,0,2),(3,6,0.5,1),(3,12,NULL,NULL),(3,13,NULL,NULL),(3,16,4,NULL),(3,17,2,10),(3,18,0,1),(3,19,2,3),(3,20,0.25,1),(3,21,0.5,1),(3,22,0.25,1),(3,23,0.5,1),(3,28,1,1),(4,4,0.5,1),(4,6,2,3),(4,11,16,6),(4,12,NULL,NULL),(4,13,NULL,NULL),(4,18,2,3),(4,24,2.5,3),(5,12,NULL,NULL),(5,15,0.5,3),(5,17,4,10),(6,1,8,4),(6,12,0.5,2),(6,13,0.125,2),(6,15,4,3),(6,30,2,8),(7,4,1,8),(7,12,0.5,2),(7,17,6,10),(7,32,2,3),(7,33,1,2),(7,34,1,2),(7,35,1,2),(7,36,1,3),(7,37,1,11),(8,12,0.5,2),(8,15,2,3),(8,19,2,1),(8,27,0.5,1),(8,34,2,3),(8,38,0.25,1),(8,39,0.25,6),(9,3,1,5),(9,4,0.5,1),(9,5,2,7),(9,7,1,9),(9,12,1.5,2),(9,13,0.25,2),(9,17,1,10),(9,20,0.75,5),(9,21,2,9),(9,22,1.5,2),(9,34,2,3),(9,38,0.5,1),(9,40,1,5),(9,41,2,9),(9,42,1,2),(9,43,4,3),(9,44,12,NULL),(9,45,16,6),(9,46,0.75,1),(10,1,6,4),(10,12,NULL,NULL),(10,15,1,3),(10,17,2,10),(10,27,0.666666666,1),(10,47,1,2),(10,48,0.25,2),(11,12,0.25,2),(11,15,3,3),(11,17,1,10),(11,19,1.5,1),(11,27,1.25,1),(11,34,1,3),(11,49,3.5,2),(12,4,1,8),(12,5,3,7),(12,12,NULL,NULL),(12,13,NULL,NULL),(12,15,2,3),(12,26,2,8),(12,36,2,8),(12,43,2,3),(12,50,8,1),(12,51,2,NULL),(12,52,2.5,5),(12,53,2.5,1),(12,54,2,3),(12,55,1,3),(13,5,5,7),(13,6,0.333333333,1),(13,8,0.5,2),(13,12,NULL,NULL),(13,15,4,3),(13,43,0.25,1),(13,55,1,3),(13,56,12,6),(13,57,1.25,5),(13,58,0.333333333,1),(14,12,0.75,2),(14,13,0.75,2),(14,17,5,NULL),(14,32,1.5,1),(14,33,3,3),(14,35,1,3),(14,36,2,NULL),(14,37,NULL,NULL),(14,59,6,8),(15,12,NULL,NULL),(15,13,NULL,NULL),(15,15,2,3),(15,27,1,1),(15,61,2,5),(16,6,2,2),(16,10,1,2),(16,12,0.5,2),(16,13,0.5,2),(16,16,4,NULL),(16,37,1,2),(16,62,1.5,3),(16,63,0.25,2),(17,4,1,12),(17,5,3,7),(17,12,NULL,NULL),(17,13,NULL,NULL),(17,15,3,3),(17,17,2,10),(17,26,2,8),(17,60,3,NULL),(17,64,0.5,1),(17,65,4,1),(17,66,3,3),(17,67,2,2),(17,68,0.5,2),(18,2,4,4),(18,3,1,5),(18,12,NULL,NULL),(18,13,NULL,NULL),(18,69,4,NULL),(18,70,1,10),(18,71,0.5,13),(18,72,0.5,8),(18,73,0.5,1),(19,3,1,5),(19,4,1,8),(19,6,1,3),(19,12,1.5,2),(19,13,0.5,2),(19,21,1,9),(19,34,2,3),(19,41,2,3),(19,63,1,3),(19,74,2.5,3),(19,75,2,3),(19,76,0.25,2),(19,77,1.5,1),(19,78,1,9),(19,79,1,9);
/*!40000 ALTER TABLE `recipe_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppinglist`
--

DROP TABLE IF EXISTS `shoppinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppinglist` (
  `userID` int NOT NULL,
  `ingredientID` int NOT NULL,
  PRIMARY KEY (`userID`,`ingredientID`),
  KEY `shoppinglist_ingredient_fk` (`ingredientID`),
  CONSTRAINT `shoppinglist_ingredient_fk` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shoppinglist_user_fk` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppinglist`
--

LOCK TABLES `shoppinglist` WRITE;
/*!40000 ALTER TABLE `shoppinglist` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppinglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (13,'bunch'),(9,'can'),(7,'clove'),(1,'cup'),(10,'large'),(5,'lb'),(8,'medium'),(6,'oz'),(11,'pinch'),(4,'slice'),(12,'small'),(3,'tbsp'),(2,'tsp');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'lucyy','Ilikecooking');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'recipe'
--

--
-- Dumping routines for database 'recipe'
--
/*!50003 DROP FUNCTION IF EXISTS `ingredientExists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ingredientExists`(ingredient_p VARCHAR(64)) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    
	IF EXISTS(SELECT 1 FROM ingredient WHERE name = ingredient_p LIMIT 1) THEN
		RETURN TRUE;
	ELSE 
		RETURN FALSE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `inShoppingList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `inShoppingList`(username_p VARCHAR(64), ingredient_p VARCHAR(64)) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    
	DECLARE user_id, ingredient_id INT;
    SELECT id INTO user_id FROM user WHERE username = username_p;
    SELECT id INTO ingredient_id FROM ingredient WHERE name = ingredient_p;
	IF EXISTS(SELECT 1 FROM shoppinglist WHERE userID = user_id AND ingredientID = ingredient_id LIMIT 1) THEN
		RETURN TRUE;
	ELSE 
		RETURN FALSE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `passwordCorrect` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `passwordCorrect`(username_p VARCHAR(64), password_p VARCHAR(64)) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    
	IF EXISTS(SELECT 1 FROM user WHERE username = username_p AND password = password_p LIMIT 1) THEN
		RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addIngredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addIngredient`(name_p VARCHAR(40), calories_p INT, unit_name VARCHAR(30))
BEGIN
	DECLARE given_unitID INT;
    SELECT id INTO given_unitID FROM unit
		WHERE unit.name = unit_name;
	INSERT INTO ingredient (name, calories, unitID)
		VALUES (name_p, calories_p, given_unitID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addIngredientToInv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addIngredientToInv`(username_p VARCHAR(64), ingredient_p VARCHAR(40))
BEGIN
	DECLARE user_id, ingredient_id INT;
    SELECT id INTO user_id FROM user WHERE username = username_p;
    SELECT id INTO ingredient_id FROM ingredient WHERE name = ingredient_p;
	IF NOT EXISTS(SELECT 1 FROM ingredient_inventory WHERE userID = user_id AND ingredientID = ingredient_id LIMIT 1) THEN
		INSERT INTO ingredient_inventory (userID, ingredientID)
			VALUES (user_id, ingredient_id);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addIngredientToRecipe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addIngredientToRecipe`(ingredient_p VARCHAR(64), recipe_p VARCHAR(40), count_p DOUBLE, unit_P VARCHAR(30))
BEGIN
	DECLARE recipe_id, ingredient_id, unit_id INT;
    SELECT id INTO recipe_id FROM recipe WHERE name = recipe_p;
    SELECT id INTO ingredient_id FROM ingredient WHERE name = ingredient_p;
    SELECT id INTO unit_id FROM unit WHERE name = unit_P;
	INSERT INTO recipe_ingredient (recipeID, ingredientID, count, unitID)
		VALUES (recipe_id, ingredient_id, count_p, unit_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addRecipe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addRecipe`(name_p VARCHAR(100), time_p INT, servings_p INT, instructions_p TEXT)
BEGIN
	IF NOT EXISTS(SELECT 1 FROM recipe WHERE name = name_p LIMIT 1) THEN
		INSERT INTO recipe (name, time, servings, instructions)
			VALUES (name_p, time_p, servings_p, instructions_p);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addToShoppingList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addToShoppingList`(username_p VARCHAR(64), ingredient_p VARCHAR(64))
BEGIN
	DECLARE user_id, ingredient_id INT;
    -- DECLARE inShoppingList BOOLEAN;
    SELECT id INTO user_id FROM user WHERE username = username_p;
    SELECT id INTO ingredient_id FROM ingredient WHERE name = ingredient_p;
    -- SET inShoppingList = CALL inShoppingList(username_p, ingredient_p);
    IF NOT (inShoppingList(username_p, ingredient_p)) THEN
		INSERT INTO shoppinglist (userID, ingredientID)
				VALUES (user_id, ingredient_id);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addUser`(username_p VARCHAR(64), password_p VARCHAR(64))
BEGIN
	INSERT INTO user (username, password)
		VALUES (username_p, password_p);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInventory`(username_p VARCHAR(64))
BEGIN
	DECLARE user_id INT;
    SELECT id INTO user_id FROM user WHERE username = username_p;
    SELECT ingredient.name AS ingredient FROM ingredient_inventory JOIN ingredient
		ON ingredientID = ingredient.id
		WHERE userID = user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRecipeIngredients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRecipeIngredients`(recipe_p VARCHAR(100))
BEGIN
	DECLARE recipe_id INT;
    SELECT id INTO recipe_id FROM recipe WHERE name = recipe_p;
	SELECT ingredient.name AS ingredient FROM recipe_ingredient JOIN ingredient
		on recipe_ingredient.ingredientID = ingredient.id
        WHERE recipeID = recipe_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getShoppingList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getShoppingList`(username_p VARCHAR(64))
BEGIN
	DECLARE user_id INT;
    SELECT id INTO user_id FROM user WHERE username = username_p;
    SELECT ingredient.name AS ingredient FROM shoppinglist JOIN ingredient
		ON ingredientID = ingredient.id
		WHERE userID = user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remIngredientFromInv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remIngredientFromInv`(username_p VARCHAR(64), ingredient_p VARCHAR(40))
BEGIN
	DECLARE user_id, ingredient_id INT;
    SELECT id INTO user_id FROM user WHERE username = username_p;
    SELECT id INTO ingredient_id FROM ingredient WHERE name = ingredient_p;
	IF EXISTS(SELECT 1 FROM ingredient_inventory WHERE userID = user_id AND ingredientID = ingredient_id LIMIT 1) THEN
		DELETE FROM ingredient_inventory WHERE userID = user_id AND ingredientID = ingredient_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remIngredientFromShoppingList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remIngredientFromShoppingList`(username_p VARCHAR(64), ingredient_p VARCHAR(40))
BEGIN
	DECLARE user_id, ingredient_id INT;
    SELECT id INTO user_id FROM user WHERE username = username_p;
    SELECT id INTO ingredient_id FROM ingredient WHERE name = ingredient_p;
	IF EXISTS(SELECT 1 FROM shoppinglist WHERE userID = user_id AND ingredientID = ingredient_id LIMIT 1) THEN
		DELETE FROM shoppinglist WHERE userID = user_id AND ingredientID = ingredient_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27 21:13:21
