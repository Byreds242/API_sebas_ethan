from flask import Flask
from bd import init_db, db
from auth import auth_bp

def create_app():
    app = Flask(__name__)
    init_db(app)
    
    with app.app_context():
        db.create_all()  # Crear las tablas al iniciar la app
    
    # MODIFICAR Y PONER LA RUTA
    app.register_blueprint(auth_bp, url_prefix='/auth')
    
    return app

if __name__ == '__main__':
    app = create_app()
    app.run(debug=True)
