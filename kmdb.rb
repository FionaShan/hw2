# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!
## -> completed under `db`, `migrate`

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# a) Insert data for Studio
warner_bros = Studio.new
warner_bros ["name"] = "Warner Bros."
warner_bros.save

# b) Insert data for Movie
batman_begins = Movie.new
batman_begins ["title"] = "Batman Begins"
batman_begins ["year_released"] = 2005
batman_begins ["rated"] = "PG-13"
batman_begins ["studio"] = warner_bros
batman_begins.save

the_dark_knight = Movie.new
the_dark_knight ["title"] = "The Dark Knight"
the_dark_knight ["year_released"] = 2008
the_dark_knight ["rated"] = "PG-13"
the_dark_knight ["studio"] = warner_bros
the_dark_knight.save

the_dark_knight_rises = Movie.new
the_dark_knight_rises ["title"] = "The Dark Knight Rises"
the_dark_knight_rises ["year_released"] = 2012
the_dark_knight_rises ["rated"] = "PG-13"
the_dark_knight_rises ["studio"] = warner_bros
the_dark_knight_rises.save

# c) Insert data for Actor
christian_bale = Actor.new
christian_bale ["name"] = "Christian Bale"
christian_bale.save

michael_caine = Actor.new
michael_caine ["name"] = "Michael Caine"
michael_caine.save

liam_neeson = Actor.new
liam_neeson ["name"] = "Liam Neeson"
liam_neeson.save

katie_holmes = Actor.new
katie_holmes ["name"] = "Katie Holmes"
katie_holmes.save

gary_oldman = Actor.new
gary_oldman ["name"] = "Gary Oldman"
gary_oldman.save

heath_ledger = Actor.new
heath_ledger ["name"] = "Heath Ledger"
heath_ledger.save

aaron_eckhart = Actor.new
aaron_eckhart ["name"] = "Aaron Eckhart"
aaron_eckhart.save

maggie_gyllenhaal = Actor.new
maggie_gyllenhaal ["name"] = "Maggie Gyllenhaal"
maggie_gyllenhaal.save

tom_hardy = Actor.new
tom_hardy ["name"] = "Tom Hardy"
tom_hardy.save

joseph_gordon_levitt = Actor.new
joseph_gordon_levitt ["name"] = "Joseph Gordon-Levitt"
joseph_gordon_levitt.save

anne_hathaway = Actor.new
anne_hathaway ["name"] = "Anne Hathaway"
anne_hathaway.save


# d) Insert data for Role

batman_begins = Movie.find_by({"title" => "Batman Begins"})
christian_bale = Actor.find_by ({"name" => "Christian Bale"})
role1 = Role.new
role1["character_name"] = "Bruce Wayne"
role1["movie_id"] = batman_begins ["id"]
role1["actor_id"] = christian_bale ["id"]
role1.save
#p role1

batman_begins = Movie.find_by({"title" => "Batman Begins"})
michael_caine = Actor.find_by ({"name" => "Michael Caine"})
role2 = Role.new
role2["character_name"] = "Alfred"
role2["movie_id"] = batman_begins ["id"]
role2["actor_id"] = michael_caine ["id"]
role2.save
#p role2

batman_begins = Movie.find_by({"title" => "Batman Begins"})
liam_neeson = Actor.find_by({"name" => "Liam Neeson"})
role3 = Role.new
role3["character_name"] = "Ra's Al Ghul"
role3["movie_id"] = batman_begins["id"]
role3["actor_id"] = liam_neeson["id"]
role3.save


batman_begins = Movie.find_by({"title" => "Batman Begins"})
katie_holmes = Actor.find_by({"name" => "Katie Holmes"})
role4 = Role.new
role4["character_name"] = "Rachel Dawes"
role4["movie_id"] = batman_begins["id"]
role4["actor_id"] = katie_holmes["id"]
role4.save

batman_begins = Movie.find_by({"title" => "Batman Begins"})
gary_oldman = Actor.find_by({"name" => "Gary Oldman"})
role5 = Role.new
role5["character_name"] = "Commissioner Gordon"
role5["movie_id"] = batman_begins["id"]
role5["actor_id"] = gary_oldman["id"]
role5.save

the_dark_knight = Movie.find_by({"title" => "The Dark Knight"})
christian_bale = Actor.find_by ({"name" => "Christian Bale"})
role6 = Role.new
role6["character_name"] = "Bruce Wayne"
role6["movie_id"] = the_dark_knight ["id"]
role6["actor_id"] = christian_bale ["id"]
role6.save


the_dark_knight = Movie.find_by({"title" => "The Dark Knight"})
heath_ledger = Actor.find_by({"name" => "Heath Ledger"})
role7 = Role.new
role7["character_name"] = "Joker"
role7["movie_id"] = the_dark_knight["id"]
role7["actor_id"] = heath_ledger["id"]
role7.save

the_dark_knight = Movie.find_by({"title" => "The Dark Knight"})
aaron_eckhart = Actor.find_by({"name" => "Aaron Eckhart"})
role8 = Role.new
role8["character_name"] = "Harvey Dent"
role8["movie_id"] = the_dark_knight["id"]
role8["actor_id"] = aaron_eckhart["id"]
role8.save

the_dark_knight = Movie.find_by({"title" => "The Dark Knight"})
michael_caine = Actor.find_by({"name" => "Michael Caine"})
role9 = Role.new
role9["character_name"] = "Alfred"
role9["movie_id"] = the_dark_knight["id"]
role9["actor_id"] = michael_caine["id"]
role9.save

the_dark_knight = Movie.find_by({"title" => "The Dark Knight"})
maggie_gyllenhaal = Actor.find_by({"name" => "Maggie Gyllenhaal"})
role10 = Role.new
role10["character_name"] = "Rachel Dawes"
role10["movie_id"] = the_dark_knight["id"]
role10["actor_id"] = maggie_gyllenhaal["id"]
role10.save

the_dark_knight_rises = Movie.find_by({"title" => "The Dark Knight Rises"})
christian_bale = Actor.find_by({"name" => "Christian Bale"})
role11 = Role.new
role11["character_name"] = "Bruce Wayne"
role11["movie_id"] = the_dark_knight_rises["id"]
role11["actor_id"] = christian_bale ["id"]
role11.save

the_dark_knight_rises = Movie.find_by({"title" => "The Dark Knight Rises"})
gary_oldman = Actor.find_by({"name" => "Gary Oldman"})
role12 = Role.new
role12["character_name"] = "Commissioner Gordon"
role12["movie_id"] = the_dark_knight_rises["id"]
role12["actor_id"] = gary_oldman["id"]
role12.save

the_dark_knight_rises = Movie.find_by({"title" => "The Dark Knight Rises"})
tom_hardy = Actor.find_by({"name" => "Tom Hardy"})
role13 = Role.new
role13["character_name"] = "Bane"
role13["movie_id"] = the_dark_knight_rises["id"]
role13["actor_id"] = tom_hardy["id"]
role13.save

the_dark_knight_rises = Movie.find_by({"title" => "The Dark Knight Rises"})
joseph_gordon_levitt = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
role14 = Role.new
role14["character_name"] = "John Blake"
role14["movie_id"] = the_dark_knight_rises["id"]
role14["actor_id"] = joseph_gordon_levitt["id"]
role14.save

the_dark_knight_rises = Movie.find_by({"title" => "The Dark Knight Rises"})
anne_hathaway = Actor.find_by({"name" => "Anne Hathaway"})
role15 = Role.new
role15["character_name"] = "Selina Kyle"
role15["movie_id"] = the_dark_knight_rises["id"]
role15["actor_id"] = anne_hathaway["id"]
role15.save


# # Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# # Query the movies data and loop through the results to display the movies output.
# # TODO!

movies = Movie.all
for movie in movies
    title = movie ["title"]
    year_released = movie ["year_released"]
    rated = movie ["rated"]
    studio_name = movie ["studio_name"]
    puts "#{title} #{year_released} #{rated} #{studio_name}"
end


# # Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# # Query the cast data and loop through the results to display the cast output for each movie.
# # TODO!

roles = Role.all
for role in roles
    movie_title = role ["movie_title"]
    actor_name = role ["actor_name"]
    character_name = role ["character_name"]
puts "#{movie_title} #{actor_name} #{character_name}"
end

