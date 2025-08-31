Shofman Blog API

A Django-based RESTful Blog API that provides authentication, blog post management, and related functionalities. This project is designed to serve as a backend for a blogging platform, supporting user accounts, post creation, categorization, and permissions.


 Features
- User Authentication (Sign up, Login, JWT-based authentication)
- Blog Management (Create, Read, Update, Delete posts)
- Categories & Tags for organizing posts
- Permissions & Roles (e.g., only authors can edit their posts)
- Comment System for user interaction
- SQLite (default) / MySQL support
- REST API with Django REST Framework (DRF)


 Tech Stack
- Backend: Django, Django REST Framework
- Database: SQLite (development), MySQL (production-ready)
- Authentication: JWT
- Deployment: PythonAnywhere / Custom server


 Installation & Setup
 1. Clone the repository 
 bash
 git clone https://github.com/<your-username>/ShofmanBlogApi-main.git
 cd ShofmanBlogApi-main/mysite


 2. Create & activate a virtual environment
bash
python -m venv venv
source venv/bin/activate    On Linux/Mac
venv\Scripts\activate       On Windows

 3. Install dependencies
bash
pip install -r requirements.txt

 4. Configure environment variables
- Update mysite/mysql_config.py for MySQL usage.
- Default database is db.sqlite3 (no extra setup required).

 5. Run migrations
bash
python manage.py migrate


 6. Create a superuser
bash
python manage.py createsuperuser


 7. Start the development server
bash
python manage.py runserver


The API will be available at: http://127.0.0.1:8000/


 Project Structure

ShofmanBlogApi-main/
├── mysite/
│   ├── auth_app/         Handles authentication & users
│   ├── core/             Blog core features (posts, categories, comments)
│   ├── db.sqlite3        Default SQLite database
│   ├── manage.py         Django project manager
│   └── mysql_config.py   MySQL database configuration
├── requirements.txt      Dependencies
├── devserver.sh          Dev server script
├── pythonanywhere_config.py  Deployment config
└── README.md


 API Endpoints (Examples)

- Auth
  - POST /api/auth/register/ → Register user
  - POST /api/auth/login/ → Login & get JWT

- Posts
  - GET /api/posts/ → List all posts
  - POST /api/posts/ → Create new post
  - GET /api/posts/{id}/ → Get post details
  - PUT /api/posts/{id}/ → Update post
  - DELETE /api/posts/{id}/ → Delete post

- Comments
  - POST /api/posts/{id}/comments/ → Add comment
  - GET /api/posts/{id}/comments/ → List comments


 Deployment

- Can be deployed on PythonAnywhere (see pythonanywhere_config.py).
- Alternatively, configure Gunicorn + Nginx for production deployment.

 Contributing

1. Fork the repo
2. Create a feature branch (git checkout -b feature-name)
3. Commit your changes (git commit -m 'Add feature')
4. Push to branch (git push origin feature-name)
5. Create a Pull Request



