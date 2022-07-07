# Ruby-Alkemy-Challenge

API builded in Ruby On Rails, using PostgreSQL as database, SendGrid for email notification and Insomnia for API documentation.

Database Models:

![dbModels](https://user-images.githubusercontent.com/92605158/177830910-cf973867-1f60-4e6c-bd92-0c391e92bfde.png)

User Authentication:

To use the API,you should create an user, you will receive a Welcome email:

POST http://127.0.0.1:3000/users

![CreateUserRC](https://user-images.githubusercontent.com/92605158/177831418-20af3200-741a-497a-a499-fa6dab769fa9.png)

Login with the user to generate the Token:

POST http://127.0.0.1:3000/auth/login

![LoginUserRC](https://user-images.githubusercontent.com/92605158/177831768-803d2185-ddee-4b40-a790-caf618095321.png)

To get all users you should add the Authorization Token:

GET http://127.0.0.1:3000/users

![GetAllUsersRC](https://user-images.githubusercontent.com/92605158/177833048-92485cdb-8484-4b34-ae38-6e23fad2e75c.png)

To search user, add the Authorization Token and the Username to the Url.

GET http://127.0.0.1:3000/users/{username}

![GetUserByUsernameRC](https://user-images.githubusercontent.com/92605158/177833137-0171dcad-d77b-478c-8594-3cd5ca02b289.png)

Characters CRUD:

To create a character, add the Authorization Token and the parameters:

POST http://127.0.0.1:3000/api/v1/characters

![CreateCharacterRC](https://user-images.githubusercontent.com/92605158/177834845-5232f87c-2aa1-4672-b3dd-cfa8b576ca25.png)

To get all characters, add the Authorization Token, shows Image and Name:

GET http://127.0.0.1:3000/api/v1/characters

![GetAllCharactersRC](https://user-images.githubusercontent.com/92605158/177835169-7a051ca7-9435-4365-a24a-cf0f7f521b2d.png)

To search character, add the Authorization Token and the Name to the URL:

GET http://127.0.0.1:3000/api/v1/characters/{name}

![GetCharacterByNameRC](https://user-images.githubusercontent.com/92605158/177837386-d69bac3d-1e8f-4998-a0bc-dc8595fd3ae8.png)

To update a character, add the Authorization Token, the name to the URL and the parameters to modifie:

PUT http://127.0.0.1:3000/api/v1/characters/{name}

![UpdateCharacterRC](https://user-images.githubusercontent.com/92605158/177837897-ea91e2f6-617b-41f9-86b7-ce520a30202a.png)

To delete a character, add the Authorization Token, and the name to the URL:

DELETE http://127.0.0.1:3000/api/v1/characters/{name}

To filter characters by age, add the Authorization Token and the parameters to the URL:

GET http://127.0.0.1:3000/api/v1/characters?by_age[from]={age}&by_age[to]={age}

![FilterCharacterByAge](https://user-images.githubusercontent.com/92605158/177838656-fc610e3c-1d5b-41e5-bb0c-fcf2df40fc4f.png)

To filter characters by weight, add the Authorization Token and the parameters to the URL:

GET http://127.0.0.1:3000/api/v1/characters?by_weight[from]={weight}&by_weight[to]={weight}

![FilterCharacterByWeight](https://user-images.githubusercontent.com/92605158/177839009-55bfbdaa-6c98-4bf2-b987-94891a80ba95.png)

To filter characters by name, add the Authorization Token and the name to the URL:

GET http://127.0.0.1:3000/api/v1/characters?by_name={name}

![FilterCharacterByName](https://user-images.githubusercontent.com/92605158/177839571-347ef733-201d-4eb5-8307-8ad211c08f21.png)

To filter characters by movie, add the Authorization Token and the movie id to the URL:

GET http://127.0.0.1:3000/api/v1/characters?by_movie={id}

![FilterCharacterByMovie](https://user-images.githubusercontent.com/92605158/177839933-060fde6d-cf54-48bc-b4b7-1a8b2a756642.png)

Movies CRUD:

To create a movie, add the Authorization Token and the parameters:

POST http://127.0.0.1:3000/api/v1/movies

![CreateMovieRC](https://user-images.githubusercontent.com/92605158/177841773-0ecfc81b-4656-4004-bd25-593442865964.png)

To get all movies, add the Authorization Token, shows Image, Title and Release Date:

GET http://127.0.0.1:3000/api/v1/movies

![GetAllMoviesRC](https://user-images.githubusercontent.com/92605158/177843920-8264babc-6fbf-4848-90f7-3b57e7fb7d9d.png)

To search character, add the Authorization Token and the Name to the URL:

GET http://127.0.0.1:3000/api/v1/movies/{title}

![GetMovieByNameRC](https://user-images.githubusercontent.com/92605158/177844133-7a69f5ff-f233-47b7-9fa0-cbf4a8c9d251.png)

To update a movie, add the Authorization Token, the name to the URL and the parameters to modifie:

PUT http://127.0.0.1:3000/api/v1/movies/{title}

![UpdateMovieRC](https://user-images.githubusercontent.com/92605158/177855682-c89fc250-b157-45bb-8547-4ca7ef9faeea.png)

To delete a movie, add the Authorization Token, and the name to the URL:

DELETE http://127.0.0.1:3000/api/v1/characters/{title}

To filter movies by genre, add the Authorization Token and the parameters to the URL:

GET http://127.0.0.1:3000/api/v1/movies?by_genre={id}

![FilterMovieByGenre](https://user-images.githubusercontent.com/92605158/177856248-7c1f941b-3c84-4400-9dad-87e0b5604e92.png)

To filter movies by oder, add the Authorization Token and the parameters to the URL:

GET http://127.0.0.1:3000/api/v1/movies?order=ASC

![SetASC_MovieOrder](https://user-images.githubusercontent.com/92605158/177856709-f7d4c800-0f59-4f3f-a270-af5385d2b349.png)

GET http://127.0.0.1:3000/api/v1/movies?order=DESC

![SetDESC_MovieOrder](https://user-images.githubusercontent.com/92605158/177856817-4a98cbde-9d05-4b31-a572-d8180fef2fe2.png)

Genres CRUD:

To create a genre, add the Authorization Token and the parameters:

POST http://127.0.0.1:3000/api/v1/genres

![CreateGenreRC](https://user-images.githubusercontent.com/92605158/177857518-1723d89c-19a4-4de5-ad11-f01e77dad562.png)

To get all genres, add the Authorization Token, shows Id and Name:

GET http://127.0.0.1:3000/api/v1/genres

![GetAllGenresRC](https://user-images.githubusercontent.com/92605158/177857763-19f74b31-6886-48c0-8e3a-470593d3661c.png)

To search genre, add the Authorization Token and the Name to the URL:

GET http://127.0.0.1:3000/api/v1/genres/{name}

![GetMovieByNameRC](https://user-images.githubusercontent.com/92605158/177844133-7a69f5ff-f233-47b7-9fa0-cbf4a8c9d251.png)

To update a movie, add the Authorization Token, the name to the URL and the parameters to modifie:

PUT http://127.0.0.1:3000/api/v1/genres/{name}

![UpdateGenreRC](https://user-images.githubusercontent.com/92605158/177858159-1cc90fde-1314-49eb-9b2a-94850fc45e91.png)

To delete a genre, add the Authorization Token, and the name to the URL:

DELETE http://127.0.0.1:3000/api/v1/characters/{name}


