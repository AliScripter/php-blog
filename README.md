# Simple Blog PHP

This is a simple blog built with **PHP**, **MySQL**, and **Bootstrap**. This project allows you to set up a basic blog with various features.

[ٰVisite the website](https://devnest.space/web/) 
**Online until:** June 13, 2025 (Friday)  

## Features

### **Home Page**

- Display posts as a list.
- **Search** functionality to find posts by title or content.
- Display **categories** of posts.
- **Email subscription** to receive newsletters or updates from the blog.

### **Admin Panel**

- Manage posts:
  - Create, edit, and delete posts.
- Manage comments:
  - Approve or delete comments.
- Manage categories:
  - Create and edit new categories.
- **Admin authentication**:
  - Only authenticated users can access the admin panel.

## Database

This project uses **MySQL** as the database to store information.

### Main database tables:

1. **posts**: Stores information about posts (title, content, date, category, etc.).
2. **comments**: Stores comments for each post.
3. **categories**: Stores various categories for posts.
4. **users**: Stores user information for authentication and admin access.

## Technologies

- **Backend**: PHP
- **Frontend**: HTML, CSS (Bootstrap)
- **Database**: MySQL

## Installation and Setup

1. **Clone the project**:

   ```bash
   git clone https://github.com/AliScripter/php-blog
   ```

2. **Create the database**:
   Create the database in MySQL and import the required tables. (The corresponding SQL file is included in the project).

3. **Configure database connection**:
   Set up the database details in the `config.php` file.

4. **Run the project**:
   Run the project on a PHP server (like XAMPP or LAMP) and visit `localhost` in your browser.

## Usage

- **Home Page**:
  - Users can view posts.
  - Use the search feature to find posts.
  - Subscribe to receive newsletters by entering their email.
- **Admin Panel**:
  - Only authenticated users can access the admin panel.
  - In the admin panel, you can manage posts, comments, and categories.

## Development Environment

This project is designed for local development. For deployment in other environments, additional configurations may be required.

## Contributing

If you'd like to contribute or expand this project, we welcome your help! Feel free to submit a **pull request**.
