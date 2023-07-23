from flask import Flask, request, jsonify, render_template

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        data = request.form.get('json_data')
        return jsonify(data)

    return render_template('form.html')

if __name__ == '__main__':
    app.run()
