from mods.config import *
from flask import Flask, render_template, redirect, request
from postgresconnection import connectToPostgres              # import the function that will return an instance of a connection

app = Flask(__name__)

# Crear tabla con pgadmin: https://x-team.com/blog/automatic-timestamps-with-postgresql/
# INSERT INTO public.pets(
#	name, type)
#	VALUES ('Laica', 'dog') RETURNING *;

@app.route("/")
def index():
    postgres = connectToPostgres(DB_NAME, DB_HOST, DB_USER, DB_PASS)                     # call the function, passing in the name of our db
    lasMascotasDB = postgres.query_db("SELECT id,name,type FROM pets;")  # call the query_db function, pass in the query as a string
    print(lasMascotasDB, type(lasMascotasDB))

    return render_template("index.html", pets = lasMascotasDB)

@app.route("/create_pet", methods=["POST"])
def add_friend_to_db():
    # QUERY: INSERT INTO first_flask (first_name, last_name, occupation, created_at, updated_at) 
    #                         VALUES (fname from form, lname from form, occupation from form, NOW(), NOW());
    #query = "INSERT INTO pets (name, type, created_at, updated_at) VALUES (%(na)s, %(ty)s, NOW(), NOW());"
    query = """
        INSERT INTO public.pets(
        name, type)
        VALUES (%(na)s, %(ty)s) RETURNING *;
        """
    data = {
        'na': request.form['name'],
        'ty': request.form['type'],
    }
    postgres = connectToPostgres(DB_NAME, DB_HOST, DB_USER, DB_PASS)
    postgres.query_db(query, data)
    print(request.form)
    return redirect("/")

if __name__ == "__main__":
    app.run(debug=True)