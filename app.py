from flask import Flask, render_template, request, redirect, url_for
from sqlalchemy import create_engine, Column, Integer, String, DateTime
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine
import pyodbc
import os

# Initialise Flask App
app = Flask(__name__)

# database connection 
server = os.environ["AZURE_SERVER"]
database = os.environ['AZURE_DATABASE']
username = os.environ['AZURE_USERNAME']
password = os.environ['AZURE_PASSWORD']
driver= os.environ['AZURE_DRIVER']

# Create the connection string
connection_string = f'Driver={driver};\
    Server=tcp:{server},1433;\
    Database= {database};\
    Uid={username};\
    Pwd={password};\
    Encrypt=yes;\
    TrustServerCertificate=no;'

# Create the engine to connect to the database
engine = create_engine("mssql+pyodbc:///?odbc_connect={}".format(connection_string))

# Create the Session
Session = sessionmaker(bind=engine)

# Define the Order data model
Base = declarative_base()

class Order(Base):
    __tablename__ = 'orders'
    date_uuid = Column('date_uuid', String, primary_key=True)
    user_id = Column('User ID', String, primary_key=True)
    card_number = Column('Card Number', String)
    store_code = Column('Store Code', String)
    product_code = Column('product_code', String)
    product_quantity = Column('Product Quantity', Integer)
    order_date = Column('Order Date', DateTime)
    shipping_date = Column('Shipping Date', DateTime)

# define routes
# route to display orders
@app.route('/')
def display_orders():
    # Create a session to interact with the database
    session = Session()

    # Fetch data from the database
    orders = session.query(Order).all()

    return render_template('orders.html', orders=orders)

# route to add orders
@app.route('/add_order', methods=['POST'])
def add_order():
    date_uuid = request.form.get('date_uuid')
    user_id = request.form.get('user_id')
    card_number = request.form.get('card_number')
    store_code = request.form.get('store_code')
    product_code = request.form.get('product_code')
    product_quantity = request.form.get('product_quantity')
    order_date = request.form.get('order_date')
    shipping_date = request.form.get('shipping_date')
    
    # Create a session to interact with the database
    session = Session()

    # Create a new order object using the form data
    new_order = Order(
        date_uuid=date_uuid,
        user_id=user_id,
        card_number=card_number,
        store_code=store_code,
        product_code=product_code,
        product_quantity=product_quantity,
        order_date=order_date,
        shipping_date=shipping_date
    )

    # Add the new order to the session and commit to the database
    session.add(new_order)
    session.commit()

    return redirect(url_for('display_orders'))


# run the app
if __name__ == '__main__':
    app.run(debug=True)

