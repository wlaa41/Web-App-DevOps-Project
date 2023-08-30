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
    name = request.form.get('name')
    order = request.form.get('order')
    orders.append({'name': name, 'order': order})
    return redirect(url_for('display_orders'))

# run the app
if __name__ == '__main__':
    app.run(debug=True)

