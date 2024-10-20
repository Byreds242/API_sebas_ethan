from flask import Blueprint, request, jsonify
from models import User, db

auth_bp = Blueprint('auth', __name__)

# Definir o modificar rutas de autenticación
@auth_bp.route('/register', methods=['POST'])
def register():
    username = request.json.get('username')
    password = request.json.get('password')
    
    if User.query.filter_by(username=username).first():
        return jsonify({'message': 'Username already exists'}), 400

    user = User(username=username)
    user.set_password(password)
    
    db.session.add(user)
    db.session.commit()
    
    return jsonify({'message': 'User registered successfully'}), 201

@auth_bp.route('/login', methods=['POST'])
def login():
    username = request.json.get('username')
    password = request.json.get('password')
    
    user = User.query.filter_by(username=username).first()
    
    if user and user.check_password(password):
        return jsonify({'message': 'Login successful'}), 200
    
    return jsonify({'message': 'Invalid username or password'}), 401
