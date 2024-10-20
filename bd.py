from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

def init_db(app):
    # Ruta de conexión a la base de datos
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://usuario:contraseña@host/olimpiadas'


    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.init_app(app)
