from flask import Flask, render_template, request, redirect, url_for

# Initialise Flask App
app = Flask(__name__)

# create data storage
orders = []

# define routes
# route to display orders
@app.route('/')
def display_orders():
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
    
    orders.append({
        'date_uuid': date_uuid,
        'user_id': user_id,
        'card_number': card_number,
        'store_code': store_code,
        'product_code': product_code,
        'product_quantity': product_quantity,
        'order_date': order_date,
        'shipping_date': shipping_date
    })
    return redirect(url_for('display_orders'))


# run the app
if __name__ == '__main__':
    app.run(debug=True)

