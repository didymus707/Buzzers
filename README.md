# Buzzers
This is the Capstone project of the ruby on rails curriculum

 Buzzers is based on lifestyle articles that are separated into different categories. 
 
 The main functionalities of this app includes :-

1. User logging into the app with his username.

2. The user is presented with the homepage that includes:

    - Featured article which is the article with the biggest number of votes. This article maintains a full width image as the background with its title and a truncated content

    - List of all categories in order of priority. Categories are displayed as a square with its name on the top and its most recent article's title in the bottom. While the background image of the most recent article in this category is used at the displayed image.

3. When the user clicks the category name they can see all articles in that category: 
    - Articles displayed are sorted by most recent.
    - Each article displays: image, title, truncated text as preview and its author name.
    - Number of views it has
    - Number of comments it has
    - A button to add a vote for article

4. When user opens "Write an article" page: 
A form with all necessary fields is displayed.


## Built With

- Ruby v2.7.0
- Ruby on Rails 6
- Capybara
- RSpec
- Postgres

## Deployment & Live Demo
- This app is deployed on Heroku and the live demo of the app is found below
- Click on the link below to go the live demo of the app
```
https://pure-dawn-14243.herokuapp.com/
```

## Getting Started

To get a local copy up and running follow these simple example steps.


### Setup

Install gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.


## Author

👤 **Adewale Orotayo** 
 [@didymus707](https://github.com/didymus707)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://www.microverse.org)
- [Nelson Sakwa](https://www.behance.net/sakwadesignstudio)
- [Google Fonts](https://fonts.google.com/)


