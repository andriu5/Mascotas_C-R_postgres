from mods.config import *
import psycopg2
import psycopg2.extras

class PostgresConnection:
    def __init__(self, DB_NAME, DB_HOST, DB_USER, DB_PASS):
        connection = psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASS,
            host=DB_HOST)
        self.connection = connection
    
    def query_db(self, query, data=None):
        with self.connection.cursor(cursor_factory=psycopg2.extras.RealDictCursor) as cursor: # the cursor allows me to execute statements available in SQL
            try:
                query = cursor.mogrify(query, data).decode("utf-8")
                print("Running Query:", query)
     
                executable = cursor.execute(query, data)
                # for record in executable:
                #     print(record)
                # for record in cursor:
                #     print(record)
                if query.lower().find("insert") >= 0:
                    # if the query is an insert, return the id of the last row, since that is the row we just added
                    self.connection.commit()
                    return cursor.fetchone()[0]
                elif query.lower().find("select") >= 0:
                    # if the query is a select, return everything that is fetched from the database
                    # the result will be a list of dictionaries
                    result = cursor.fetchall()
                    return result
                else:
                    # if the query is not an insert or a select, such as an update or delete, commit the changes
                    # return nothing
                    self.connection.commit()
            except Exception as e:
                # in case the query fails
                print("Error: Something went wrong,", e)
                return False
            finally:
                # close the connection
                self.connection.close()

# this connectToPostgres function creates an instance of PostgresConnection, which will be used by server.py
# connectToPostgres receives the database we're using and uses it to create an instance of PostgresConnection
def connectToPostgres(DB_NAME, DB_HOST, DB_USER, DB_PASS):
    return PostgresConnection(DB_NAME, DB_HOST, DB_USER, DB_PASS)